{ pkgs, config, lib, ... }:

{
  home.packages = with pkgs; [] ++ 
    lib.optionals (config.dev.go) [
      pkgs.staging-next.go
      gopls
      gotestsum
      gotools
    ] ++
    lib.optionals (config.dev.rust) [
      rust-analyzer
      rustup 
    ] ++ 
    lib.optionals (config.dev.node) [
      nodejs_latest
    ] ++ 
    lib.optionals (config.dev.python) [
      python3
      # Todo lsp
    ] ++ 
    lib.optionals (config.dev.java) [
      jdk22
      jetbrains.idea-ultimate
    ] ++
    lib.optionals (config.dev.dart) [
      dart
      # Todo dartls
    ] ++
    lib.optionals (config.dev.frontend) [
      emmet-ls
      eslint_d
      nodePackages.eslint
      tailwindcss
      tailwindcss-language-server
      typescript

      nodePackages.svelte-language-server
      nodePackages.volar
    ] ++
    lib.optionals (config.dev.generic_lsp) [
    ];
}
