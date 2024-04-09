{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nil
    gopls
  ];
}
