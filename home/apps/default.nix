{ pkgs, ... }:

{
  imports = [
    ./firefox.nix
  ];

  home.packages = with pkgs; [
    alacritty
    discord
    spotify
  ];
}
