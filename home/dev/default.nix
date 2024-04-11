{ lib, ... }:

{
  options = {
    dev = {
      go = lib.mkEnableOption "go developement";
      rust = lib.mkEnableOption "rust development";
      node = lib.mkEnableOption "nodejs development";
      python = lib.mkEnableOption "python3 devlopemt";
      java = lib.mkEnableOption "java development";
      dart = lib.mkEnableOption "dart development";
      docker = lib.mkEnableOption "docker lsp";
      frontend = lib.mkEnableOption "react/angular/vue/svelte/emmet lsp";
      generic_lsp = lib.mkEnableOption "lots of random language servers";
    };

    iac = {
      nix = lib.mkEnableOption "nix development";
      ansible = lib.mkEnableOption "ansible development";
      azure = lib.mkEnableOption "azure development";
    };
  };

  imports = [
    ./dev.nix
    ./iac.nix
  ];
}
