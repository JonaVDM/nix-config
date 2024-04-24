{ lib, ... }:

{
  imports = [
    ./dotfiles.nix
    ./fonts.nix

    ./apps
    ./cli
    ./gnome
    ./hyprland
    ./sway
  ];

  options = {
    wm = {
      gnome = lib.mkEnableOption "Use Gnome";
      hyprland = lib.mkEnableOption "Use Hyprland config";
      sway = lib.mkEnableOption "Use sway";
    };
  };

  config = {
    home = {
      username = "jona";
      stateVersion = "23.11";
    };

    programs.home-manager.enable = true;
  };
}
