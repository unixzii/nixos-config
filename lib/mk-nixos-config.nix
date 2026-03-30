{ inputs, lib, system, hostModules }:

let
  hmConfigModule = {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      users.cyan = ../common/home.nix;
    };
  };
in lib.nixosSystem {
  inherit system;
  modules = hostModules ++ [
    ../overlays.nix
    ../common/configuration.nix
    inputs.home-manager.nixosModules.home-manager
    hmConfigModule
  ];
  specialArgs = {
    inherit inputs;
  };
}
