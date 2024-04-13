{ pkgs, lib, config, ... }:

lib.mkIf(config.wm.hyprland)
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
