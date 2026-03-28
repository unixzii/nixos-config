{ pkgs, ... }:

{
  imports = [
    (import ./modules/zsh.nix)
    (import ./modules/starship.nix)
    (import ./modules/git.nix)
    (import ./modules/kitty.nix)
  ];

  home.username = "cyan";
  home.homeDirectory = "/home/cyan";

  home.packages = [
    pkgs.pinentry-curses
    pkgs.appimage-run
    pkgs.zoxide
    pkgs.fuzzel
    pkgs.swaybg
    pkgs.google-chrome
    pkgs._1password-cli
    pkgs._1password-gui
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

  # If we need the DE, then we need this.
  xdg.enable = true;

  home.stateVersion = "25.11";
}
