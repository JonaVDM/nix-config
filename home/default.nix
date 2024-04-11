{ lib, ... }:

{
  imports = [
    ./dotfiles.nix
    ./fonts.nix
    ./cli
    ./apps
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
