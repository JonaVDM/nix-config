{ pkgs, ... }:

{
  imports = [
    ./firefox.nix
  ];

  home.packages = with pkgs; [
    discord
    spotify
    alacritty
  ];
}
