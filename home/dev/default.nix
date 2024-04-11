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
  };

  imports = [
    ./dev.nix
  ];
}
