{ lib, ... }:

{
  options.wm = {
    gnome = lib.mkEnableOption "enable gnome";
    hyprland = lib.mkEnableOption "enable hyprland";
    sway = lib.mkEnableOption "enable sway";
  };

  imports = [
    ./gnome.nix
    ./hyprland.nix
    ./sway.nix
  ];
}
