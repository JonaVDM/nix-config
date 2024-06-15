{ pkgs, config, lib, ... }:

let
  cfg = config.j.dev;

  goPkgs = with pkgs; [
    go
    gopls
    gotestsum
    gotools
  ];

  rustPkgs = with pkgs; [
    cargo
    rust-analyzer
    rustup
  ];

  nodePkgs = with pkgs; [
    nodejs_latest
  ];

  pythonPkgs = with pkgs; [
    python3
    # Todo lsp
  ];

  javaPkgs = with pkgs; [
    jdk22
    jetbrains.idea-ultimate
  ];

  dartPkgs = with pkgs; [
    dart
    # Todo dartls
  ];

  frontendPkgs = with pkgs; [
    emmet-ls
    eslint_d
    nodePackages.eslint
    tailwindcss
    tailwindcss-language-server
    typescript

    nodePackages.svelte-language-server
    nodePackages.volar
  ];

  genericPkgs = with pkgs; [
    efm-langserver
  ];
in
{
  options.j.dev = {
    dart = lib.mkEnableOption "dart development";
    go = lib.mkEnableOption "go developement";
    java = lib.mkEnableOption "java development";
    node = lib.mkEnableOption "nodejs development";
    python = lib.mkEnableOption "python3 devlopemt";
    rust = lib.mkEnableOption "rust development";
    frontend = lib.mkEnableOption "react/angular/vue/svelte/emmet lsp";
    generic_lsp = lib.mkEnableOption "lots of random language servers";
  };

  config = {
    environment.systemPackages =
      lib.optionals cfg.go goPkgs ++
      lib.optionals cfg.rust rustPkgs ++
      lib.optionals cfg.node nodePkgs ++
      lib.optionals cfg.python pythonPkgs ++
      lib.optionals cfg.dart dartPkgs ++
      lib.optionals cfg.java javaPkgs ++
      lib.optionals cfg.frontend frontendPkgs ++
      lib.optionals cfg.generic_lsp genericPkgs;
  };
}
