{ pkgs, ... }:

{
  imports = [
    ./common
    ./dev
    ./system.nix
    ./wm
  ];

  programs.zsh.enable = true;
  users.users.jona = {
    isNormalUser = true;
    shell = pkgs.zsh;
  };
}
