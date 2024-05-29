{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-marketplace; [
      arcticicestudio.nord-visual-studio-code
      golang.go
      jnoortheen.nix-ide
      vscodevim.vim
    ];
  };
}
