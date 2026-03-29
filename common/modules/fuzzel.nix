{ pkgs, ... }:

{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        vertical-pad = 16;
        inner-pad = 8;
        line-height = 24;
      };
      border = {
        selection-radius = 8;
      };
      colors = {
        border = "ffffff30";
        background = "000000e0";
        prompt = "ffffffff";
        input = "ffffffff";
        text = "ffffffff";
        selection-text = "ffffffff";
        selection = "ffffff20";
        match = "ffac18ff";
        selection-match = "ffac18ff";
      };
    };
  };
}
