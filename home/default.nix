{ ... }:

{
  imports = [
    ./dotfiles.nix
    ./programs
  ];

  config = {
    home = {
      username = "jona";
      stateVersion = "23.11";
    };

    programs.home-manager.enable = true;
  };
}
