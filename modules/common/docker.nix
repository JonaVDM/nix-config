{ lib, config, ... }:

lib.mkIf(config.common.docker)
{
  virtualisation.docker = {
    enable = true;

    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
}
