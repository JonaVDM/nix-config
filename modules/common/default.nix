{ lib, ... }:
with lib;

{
  options.common = {
    nvidia = mkEnableOption "Enable Nvidia";
    docker = mkEnableOption "Enable Docker";
    mesa = mkEnableOption "Enable open source drivers";
    podman = mkEnableOption "Enable Podman";
    bluetooth = mkEnableOption "Enable Bluetooth";
  };

  imports = [
    ./nvidia.nix
    ./docker.nix
    ./podman.nix
    ./bluetooth.nix
  ];
}
