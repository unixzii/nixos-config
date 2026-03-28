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
    ../common/configuration.nix
    inputs.home-manager.nixosModules.home-manager
    hmConfigModule
  ];
}
