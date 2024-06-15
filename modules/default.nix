{ pkgs, ... }:

{
  imports = [
    ./dev
    ./system.nix
    ./wm
    ./gaming

    ./common/nvidia.nix
    ./common/docker.nix
    ./common/podman.nix
    ./common/bluetooth.nix
  ];

  programs.zsh.enable = true;
  users.users.jona = {
    isNormalUser = true;
    shell = pkgs.zsh;
  };
}
