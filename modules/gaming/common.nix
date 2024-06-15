{ lib, config, pkgs, ... }:

{
  options.j.gaming = {
    common = lib.mkEnableOption "Enable common packages and porgrams";
  };

  config = lib.mkIf config.j.gaming.common {
    programs = {
      gamemode.enable = true;
    };

    environment.systemPackages = with pkgs; [
      bottles
      lutris
      mangohud
    ];
  };
}
