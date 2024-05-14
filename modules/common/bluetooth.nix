{ pkgs, config, lib, ... }:

lib.mkIf config.common.bluetooth
{
  # enable bluethooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  environment.systemPackages = with pkgs; [
    bluetuith
  ];
}
