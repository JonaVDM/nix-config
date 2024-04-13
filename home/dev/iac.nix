{ pkgs, config, lib, ... }:

{
  home.packages = with pkgs; [] ++ 
    lib.optionals (config.iac.nix) [
      nixd
    ] ++
    lib.optionals (config.iac.ansible) [ # Note: untested
      ansible
      ansible-language-server
      ansible-lint
      python3
    ] ++ 
    lib.optionals (config.iac.azure) [ # Note: untested
      azure-cli
      bicep
    ];
}
