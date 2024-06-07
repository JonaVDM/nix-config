{ lib, config, pkgs, ... }:

lib.mkIf config.dev.android
{
  programs.adb.enable = true;

  environment.systemPackages = with pkgs; [
    dart
    flutter
  ];
}
