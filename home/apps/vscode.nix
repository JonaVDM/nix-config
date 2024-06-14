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

    userSettings = {
      "editor.bracketPairColorization.enabled" = true;
      "editor.guides.bracketPairs" = "active";
      "editor.lineHeight" = 25;
      "editor.rulers" = [80 120];
      "explorer.confirmDelete" = false;
      "explorer.confirmDragAndDrop" = false;
      "extensions.ignoreRecommendations" = true;
      "files.insertFinalNewline" = true;
      "files.trimTrailingWhitespace" = true;
      "keyboard.dispatch" = "keyCode";
      "telemetry.telemetryLevel" = "off";
      "update.mode" = "none";
      "workbench.colorTheme" = "Nord";
    };
  };
}
