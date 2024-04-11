{ pkgs, config, lib, ... }:

{
  home.packages = with pkgs; [] ++ 
    lib.optionals (config.dev.go) [
      go 
      gopls
      gotools
      gotestsum
    ] ++
    lib.optionals (config.dev.rust) [
      rustup 
      rust-analyzer
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
    lib.optionals (config.dev.docker) [
      docker-ls
    ] ++
    lib.optionals (config.dev.frontend) [
      nodePackages.eslint
      eslint_d
      emmet-ls
      typescript
      tailwindcss
      tailwindcss-language-server

      nodePackages.svelte-language-server
      nodePackages.volar
    ] ++
    lib.optionals (config.dev.generic_lsp) [
    ];
}
