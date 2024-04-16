{ pkgs, lib, config, ... }:

lib.mkIf(config.wm.hyprland)
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # This should be a fix for running electron apps in wayland, which always
  # kinda seemed to work on my arch install. Weirdly enough it did not work
  # here, like at all.
  # Todo: make this stuff work
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
