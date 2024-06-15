{ config, lib, pkgs, ... }:

{
  options.j = {
    podman = lib.mkEnableOption "Enable Podman";
  };

  config = lib.mkIf config.j.podman {
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
  };
}
