{ lib, ... }:
with lib;

{
  options.gaming = {
    steam = mkEnableOption "Enable Steam";
  };

  imports = [
    ./steam.nix
  ];
}
