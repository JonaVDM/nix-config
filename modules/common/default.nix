{ lib, ... }:
with lib;

{
  options.common = { 
    nvidia = mkEnableOption "Enable Nvidia";
    docker = mkEnableOption "Enable Docker";
  };

  imports = [
    ./nvidia.nix
    ./docker.nix
  ];
}
