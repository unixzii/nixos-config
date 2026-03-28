{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware = {
    graphics.enable = true;
    bluetooth.enable = true;
    nvidia = {
      modesetting.enable = true;
      # Try fixing the driver failure when resuming.
      powerManagement.enable = true;
      open = false;
    };
  };

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "cyanpc";
    networkmanager.enable = true;
    # Use my Mac mini as the gateway.
    interfaces.enp4s0.ipv4.addresses = [
      { address = "10.145.0.118"; prefixLength = 24; }
    ];
    defaultGateway = "10.145.0.200";
    nameservers = [ "198.18.0.2" ];
  };
}
