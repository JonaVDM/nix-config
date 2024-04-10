{ ... }:

{
  imports = [
    ./dotfiles.nix
    ./fonts.nix
    ./cli
    ./apps
  ];

  config = {
    home = {
      username = "jona";
      stateVersion = "23.11";
    };

    programs.home-manager.enable = true;
  };
}
