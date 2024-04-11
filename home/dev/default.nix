{ lib, ... }:

{
  options = {
    dev = {
      go = lib.mkEnableOption "go developement";
      rust = lib.mkEnableOption "rust development";
      node = lib.mkEnableOption "nodejs development";
      python = lib.mkEnableOption "python3 devlopemt";
      java = lib.mkEnableOption "java development";
    };

    iac = {
      nix = lib.mkEnableOption "nix development";
      ansible = lib.mkEnableOption "ansible development";
      azure = lib.mkEnableOption "azure development";
    };
  };

  imports = [
    ./dev.nix
    ./iac.nix
  ];
}
