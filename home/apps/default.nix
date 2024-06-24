{ pkgs, ... }:

{
  imports = [
    ./firefox.nix
    ./vscode.nix
  ];

  home.packages = with pkgs; [
    alacritty
    discord
    element-desktop
    libreoffice
    mpv
    obsidian
    spotify
    zed-editor
  ];
}
