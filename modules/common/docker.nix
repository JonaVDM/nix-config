{ lib, config, ... }:

{
  options.j = {
    docker = lib.mkEnableOption "Enable Docker";
  };

  config = lib.mkIf config.j.docker {
    virtualisation.docker = {
      enable = true;

      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
  };
}
