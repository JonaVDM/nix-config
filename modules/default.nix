{ pkgs, ... }:

{
  imports = [
    ./system.nix
    ./wm
    ./gaming

    ./common/nvidia.nix
    ./common/docker.nix
    ./common/podman.nix
    ./common/bluetooth.nix

    ./dev/android.nix
    ./dev/dev.nix
    ./dev/iac.nix
    ./dev/ops.nix
  ];

  programs.zsh.enable = true;
  users.users.jona = {
    isNormalUser = true;
    shell = pkgs.zsh;
  };
}
