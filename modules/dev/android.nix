{ lib, config, pkgs, ... }:

{
  options.j = {
    android = lib.mkEnableOption "android things";
  };

  config = lib.mkIf config.j.android {
    programs.adb.enable = true;

    environment.systemPackages = with pkgs; [
      dart
      flutter
    ];
  };
}
