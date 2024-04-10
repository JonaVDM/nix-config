{ ... }:

{
  imports = [
    ./dotfiles.nix
    ./fonts.nix
    ./cli
    ./apps
    ./gnome
  ];

  config = {
    home = {
      username = "jona";
      stateVersion = "23.11";
    };

    programs.home-manager.enable = true;
  };
}
