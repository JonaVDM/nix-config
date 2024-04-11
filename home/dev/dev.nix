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
    ] ++ 
    lib.optionals (config.dev.java) [
      jdk22
      jetbrains.idea-ultimate
    ];
}
