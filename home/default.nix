{ lib, ... }:

{
  imports = [
    ./dotfiles.nix
    ./fonts.nix

    ./apps
    ./cli
    ./gnome
    ./sway
  ];

  options = {
    wm = {
      gnome = lib.mkEnableOption "Use Gnome";
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
