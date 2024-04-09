{ lib, ... }:
with lib;

{
  options.common = { 
    nvidia = mkEnableOption "Enable Nvidia";
  };

  imports = [
    ./nvidia.nix
  ];
}
