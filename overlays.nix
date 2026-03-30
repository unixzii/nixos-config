{ inputs, ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      quickshell = inputs.qml-niri.packages.${prev.system}.quickshell;
      qml-niri = inputs.qml-niri.packages.${prev.system}.qml-niri;
    })
  ];
}
