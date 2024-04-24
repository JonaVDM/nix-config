{ pkgs, config, lib, ... }:

{
  home.packages = with pkgs; [] ++
    lib.optionals (config.iac.nix) [
      nixd
      nil
    ] ++
    lib.optionals (config.iac.ansible) [ # Note: untested
      ansible
      ansible-language-server
      ansible-lint
      python3
      yaml-language-server
      yamllint
    ] ++ 
    lib.optionals (config.iac.azure) [ # Note: untested
      azure-cli
      bicep
      dotnet-sdk_8
    ];
}
