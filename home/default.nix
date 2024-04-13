{ lib, ... }:

{
  imports = [
    ./dotfiles.nix
    ./fonts.nix

    ./apps
    ./cli
    ./dev
    ./gnome
    ./hyprland
  ];

  options = {
    wm = {
      gnome = lib.mkEnableOption "Use Gnome";
      hyprland = lib.mkEnableOption "Use Hyprland config";
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
