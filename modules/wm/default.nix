{ lib, ... }:

{
  options.wm = {
    gnome = lib.mkEnableOption "enable gnome";
    sway = lib.mkEnableOption "enable sway";
  };

  imports = [
    ./gnome.nix
    ./sway.nix
  ];
}
