{ pkgs, ... }:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Asia/Shanghai";
  i18n.defaultLocale = "en_US.UTF-8";

  users.defaultUserShell = pkgs.zsh;
  users.users = {
    root.initialPassword = "root";
    cyan = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };
  };

  # Only install a few important packages globally.
  environment.systemPackages = [
    pkgs.file
    pkgs.vim
    pkgs.git
    pkgs.fastfetch
    pkgs.xwayland-satellite
  ];
  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal"
  ];

  services = {
    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = true;
        PermitRootLogin = "yes";
      };
    };
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
    # To make "Trash" work in GNOME Files.
    gvfs.enable = true;
  };

  programs = {
    zsh.enable = true;
    niri.enable = true;
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        stdenv.cc.cc
        zlib
        openssl
      ];
    };
  };

  fonts.packages = [
    pkgs.noto-fonts
    pkgs.noto-fonts-cjk-sans
    pkgs.nerd-fonts.noto
    pkgs._0xproto
  ];

  # xdg.portal = {
  #   enable = true;
  #   xdgOpenUsePortal = true;
  #   config.common.default = "*";
  #   extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  # };

  system.stateVersion = "25.11";
}
