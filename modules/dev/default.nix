{ pkgs, ... }:

{
  imports = [
    ./lsp.nix
  ];

  environment.systemPackages = with pkgs; [
    vim
  ];
}
