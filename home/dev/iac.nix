{ pkgs, config, lib, ... }:

{
  home.packages = with pkgs; [] ++ 
    lib.optionals (config.iac.nix) [
      nixd
    ] ++
    lib.optionals (config.iac.ansible) [ # Note: untested
      python3
      ansible
      ansible-language-server
      ansible-lint
    ] ++ 
    lib.optionals (config.iac.azure) [ # Note: untested
      bicep
      azure-cli
    ];
}
