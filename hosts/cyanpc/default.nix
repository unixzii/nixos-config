{ inputs, lib, ... }:

{
  cyanpc = lib.mkNixosConfig {
    inherit inputs;
    inherit lib;
    system = "x86_64-linux";
    hostModules = [
      ./configuration.nix
    ];
  };
}
