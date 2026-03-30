{
  description = "My NixOS config";

  inputs = {
    # Courage, my boy.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    qml-niri = {
      url = "github:imiric/qml-niri/main";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.quickshell.inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }: let
    lib = nixpkgs.lib // (import ./lib);
  in {
    nixosConfigurations = import ./hosts/cyanpc {
      inherit inputs;
      inherit lib;
    };
  };
}
