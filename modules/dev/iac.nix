{ pkgs, config, lib, ... }:

let
  cfg = config.j.iac;

  nixPkgs = with pkgs; [
    nixd
    nil
    nixpkgs-fmt
  ];

  ansiblePkgs = with pkgs; [
    ansible
    ansible-language-server
    ansible-lint
    python3
    yaml-language-server
    yamllint
  ];

  azurePkgs = with pkgs; [
    azure-cli
    azure-functions-core-tools
    bicep
    (with dotnetCorePackages; combinePackages [
      sdk_6_0_1xx
      sdk_8_0_1xx
    ])
  ];
in
{
  options.j.iac = {
    ansible = lib.mkEnableOption "ansible development";
    azure = lib.mkEnableOption "azure development";
    nix = lib.mkEnableOption "nix development";
  };

  config = {
    environment.systemPackages =
      lib.optionals cfg.nix nixPkgs ++
      lib.optionals cfg.ansible ansiblePkgs ++
      lib.optionals cfg.azure azurePkgs;
  };
}
