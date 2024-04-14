{ config, lib, pkgs, ... }:

lib.mkIf(config.common.podman)
{
  virtualisation = {
    containers.enable = true;

    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  environment.systemPackages = with pkgs; [
    dive
    docker-compose
  ];
}
