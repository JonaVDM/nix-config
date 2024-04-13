{ lib, ... }:
with lib;

{
  options.common = { 
    nvidia = mkEnableOption "Enable Nvidia";
    docker = mkEnableOption "Enable Docker";
    mesa = mkEnableOption "Enable open source drivers";
  };

  imports = [
    ./nvidia.nix
    ./docker.nix
  ];
}
