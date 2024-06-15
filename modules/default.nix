{ pkgs, ... }:

{
  imports = [
    ./system.nix

    ./common/nvidia.nix
    ./common/docker.nix
    ./common/podman.nix
    ./common/bluetooth.nix

    ./dev/android.nix
    ./dev/dev.nix
    ./dev/iac.nix
    ./dev/ops.nix

    ./gaming/steam.nix
    ./gaming/common.nix

    ./wm/gnome.nix
    ./wm/sway.nix
  ];

  programs.zsh.enable = true;
  users.users.jona = {
    isNormalUser = true;
    shell = pkgs.zsh;
  };
}
