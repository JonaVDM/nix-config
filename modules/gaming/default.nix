{ lib, ... }:
with lib;

{
  options.gaming = {
    common = mkEnableOption "Enable common packages and porgrams";
    steam = mkEnableOption "Enable Steam";
  };

  imports = [
    ./steam.nix
    ./common.nix
  ];
}
