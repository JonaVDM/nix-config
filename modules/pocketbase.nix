# A service for pocketbase
{ config, lib, pkgs, ... }:

let
  cfg = config.j.pocketbase;

  homeDir = "/var/lib/pocketbase";
in
{
  options.j.pocketbase = {
    enable = lib.mkEnableOption "Enable and setup pocketbase";

    port = lib.mkOption {
      type = lib.types.port;
      default = 8090;
      description = lib.mdDoc ''
        Pocketbase port to use.
      '';
    };

    hooksDir = lib.mkOption {
      type = lib.types.str;
      default = "${homeDir}/pb_hooks";
      description = lib.mdDoc ''
        The directory with the JS app hooks
      '';
    };

    dataDir = lib.mkOption {
      type = lib.types.str;
      default = "${homeDir}/pb_hooks";
      description = lib.mdDoc ''
        The PocketBase data directory
      '';
    };

    migrationDir = lib.mkOption {
      type = lib.types.str;
      default = "${homeDir}/pb_migrations";
      description = lib.mdDoc ''
        The directory with the user defined migrations
      '';
    };

    publicDir = lib.mkOption {
      type = lib.types.str;
      default = "${homeDir}/pb_migrations";
      description = lib.mdDoc ''
        The directory to serve static files
      '';
    };

    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.pocketbase;
      defaultText = lib.literalExpression "pkgs.pocketbase";
      description = lib.mdDoc ''
        The Pocketbase package to use.
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    networking.firewall.allowedTCPPorts = [ cfg.port ];

    users = {
      users.pocketbase = {
        group = "pocketbase";
        home = homeDir;
        isSystemUser = true;
        createHome = true;
      };

      groups.pocketbase = { };
    };

    systemd.services.pocketbase = {
      wantedBy = [ "multi-user.target" ];
      enable = true;

      serviceConfig = {
        User = "pocketbase";
        Group = "pocketbase";
        Restart = "on-failure";
        WorkingDirectory = homeDir;
        RestartSec = "5s";
        Type = "exec";
        ExecStart = ''
          exec ${cfg.package}/bin/pocketbase serve
          --http 0.0.0.0:${toString cfg.port}
          --dir ${cfg.dataDir}
          --hooksDir ${cfg.hooksDir}
          --migrationsDir ${cfg.migationsDir}
          --publicDir ${cfg.publicDir}
        '';
      };
    };
  };
}
