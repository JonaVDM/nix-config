{ pkgs, ... }:

{
  imports = [
    ./common
    ./dev
  ];

  programs.zsh.enable = true;
  users.users.jona = {
    isNormalUser = true;
    shell = pkgs.zsh;
  };
}
