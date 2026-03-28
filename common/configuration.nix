{ pkgs, ... }:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Asia/Shanghai";
  i18n.defaultLocale = "en_US.UTF-8";

  users.users = {
    root.initialPassword = "root";
    cyan = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      shell = pkgs.zsh;
    };
  };

  # Only install a few important packages globally.
  environment.systemPackages = [
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
  };

  programs = {
    zsh.enable = true;
    niri.enable = true;
  };

  fonts.packages = [
    pkgs.nerd-fonts.noto
  ];

  # xdg.portal = {
  #   enable = true;
  #   xdgOpenUsePortal = true;
  #   config.common.default = "*";
  #   extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  # };

  system.stateVersion = "25.11";
}
