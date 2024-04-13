{ lib, ... }:

{
  options.wm = {
    gnome = lib.mkEnableOption "enable gnome";
    hyprland = lib.mkEnableOption "enable hyprland";
  };

  imports = [
    ./gnome.nix 
    ./hyprland.nix
  ];
}
