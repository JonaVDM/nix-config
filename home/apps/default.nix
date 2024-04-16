{ pkgs, ... }:

{
  imports = [
    ./firefox.nix
  ];

  home.packages = with pkgs; [
    alacritty
    discord
    spotify
    libreoffice
    obsidian
    logseq
  ];
}
