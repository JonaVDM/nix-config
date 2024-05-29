{ pkgs, ... }:

{
  imports = [
    ./firefox.nix
    ./vscode.nix
  ];

  home.packages = with pkgs; [
    alacritty
    discord
    spotify
    libreoffice
    obsidian
    logseq
    mpv
    zed-editor
  ];
}
