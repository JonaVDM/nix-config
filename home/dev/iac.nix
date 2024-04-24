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
    lib.optionals (config.iac.azure) [
      azure-cli
      azure-functions-core-tools
      bicep
      (with dotnetCorePackages; combinePackages [
        sdk_6_0_1xx
        sdk_8_0_1xx
      ])
    ];
}
