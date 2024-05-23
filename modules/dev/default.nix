{ lib, ... }:

{
  imports = [
    ./android.nix
    ./dev.nix
    ./iac.nix
    ./ops.nix
  ];

  options = {
    dev = {
      dart = lib.mkEnableOption "dart development";
      go = lib.mkEnableOption "go developement";
      java = lib.mkEnableOption "java development";
      node = lib.mkEnableOption "nodejs development";
      python = lib.mkEnableOption "python3 devlopemt";
      rust = lib.mkEnableOption "rust development";

      frontend = lib.mkEnableOption "react/angular/vue/svelte/emmet lsp";
      generic_lsp = lib.mkEnableOption "lots of random language servers";
      android = lib.mkEnableOption "android things";
    };

    iac = {
      ansible = lib.mkEnableOption "ansible development";
      azure = lib.mkEnableOption "azure development";
      nix = lib.mkEnableOption "nix development";
    };

    ops = {
      docker = lib.mkEnableOption "docker lsp";
      gitlab = lib.mkEnableOption "gitlab ci development";
      kind = lib.mkEnableOption "local k8s in docker";
      k8s = lib.mkEnableOption "tools for kubernetes";
    };
  };
}
