{ pkgs, config, lib, ... }:

{
  options.j = {
    bluetooth = lib.mkEnableOption "Enable Bluetooth";
  };

  config = lib.mkIf config.j.bluetooth {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    environment.systemPackages = with pkgs; [
      bluetuith
    ];
  };
}
