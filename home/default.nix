{ lib, ... }:

{
  imports = [
    ./apps
    ./cli
    ./dev
    ./dotfiles.nix
    ./fonts.nix
    ./gnome
  ];

  options = {
    wm = {
      gnome = lib.mkEnableOption "Use Gnome";
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
