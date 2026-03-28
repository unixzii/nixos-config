{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      package = pkgs.nerd-fonts.noto;
      name = "NotoMono Nerd Font";
    };
    settings = {
      hide_window_decorations = "yes";
    };
    themeFile = "ayu";
  };
}
