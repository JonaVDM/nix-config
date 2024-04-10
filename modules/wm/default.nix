{ lib, ... }:

{
  options.wm = {
    gnome = lib.mkEnableOption "enable gnome";
  };

  imports = [
    ./gnome.nix 
  ];
}
