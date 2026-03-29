{ pkgs, ... }:

{
  imports = [
    (import ./modules/zsh.nix)
    (import ./modules/starship.nix)
    (import ./modules/git.nix)
    (import ./modules/kitty.nix)
    (import ./modules/fuzzel.nix)
    (import ./modules/cursor.nix)
  ];

  home.username = "cyan";
  home.homeDirectory = "/home/cyan";

  home.packages = [
    pkgs.pinentry-curses
    pkgs.appimage-run
    pkgs.zoxide
    pkgs.swaybg
    pkgs.nautilus
    pkgs.google-chrome
    pkgs._1password-cli
    pkgs._1password-gui
    pkgs.obs-studio
  ];

  programs = {
    home-manager.enable = true;
    gpg.enable = true;
    zed-editor.enable = true;
  };

  services = {
    gpg-agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-curses;
    };
  };

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.waylandFrontend = true;
    fcitx5.addons = [
      pkgs.fcitx5-rime
    ];
  };

  # If we need the DE, then we need this.
  xdg.enable = true;

  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
  };

  home.stateVersion = "25.11";
}
