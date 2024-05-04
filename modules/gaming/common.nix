{ lib, config, pkgs, ... }:

lib.mkIf config.gaming.common
{
  programs = {
    gamemode.enable = true;
  };

  environment.systemPackages = with pkgs; [
    bottles
    lutris
    mangohud
  ];
}
