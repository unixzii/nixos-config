{ pkgs, ... }:

let
  mkCursor = { url, hash, name }: {
    gtk.enable = true;
    x11.enable = true;
    name = name;
    size = 48;
    package =
      pkgs.runCommand "build" {} ''
        mkdir -p $out/share/icons
        ln -s ${pkgs.fetchzip {
          url = url;
          hash = hash;
        }} $out/share/icons/${name}
      '';
  };
in {
  home.pointerCursor = mkCursor {
    url = "https://github.com/ful1e5/fuchsia-cursor/releases/download/v2.0.1/Fuchsia-Pop.tar.xz";
    hash = "sha256-BvVE9qupMjw7JRqFUj1J0a4ys6kc9fOLBPx2bGaapTk=";
    name = "Fuchsia-Pop";
  };
}
