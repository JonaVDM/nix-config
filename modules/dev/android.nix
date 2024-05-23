{ lib, config, ... }:

lib.mkIf config.dev.android
{
  programs.adb.enable = true;

  # environment.systemPackages = with pkgs; [
  #   android-tools
  # ];
}
