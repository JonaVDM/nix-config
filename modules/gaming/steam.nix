{ lib, config, ... }:

lib.mkIf config.gaming.steam
{
  programs = {
    steam = {
      enable = true;
    };
  };
}
