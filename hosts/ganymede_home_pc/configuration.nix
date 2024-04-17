{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

  # Bootloader.
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;

  networking.hostName = "ganymede";

  # Enable networking
  networking.networkmanager.enable = true;

  users.users.jona.extraGroups = [ "networkmanager" "wheel" ];

  wm.gnome = true;
  wm.hyprland = false;

  common = {
    nvidia = true;

    docker = true;
    podman = false;
  };

  gaming = {
    steam = true;
  };

  home-manager.users.jona = {
    wm.gnome = true;
    wm.hyprland = false;

    dev = {
      dart = false;
      go = true;
      java = false;
      node = true;
      python = true;
      rust = false;

      frontend = false;
      generic_lsp = false;
    };

    iac = {
      ansible = false;
      azure = false;
      nix = true;
    };

    ops = {
      docker = false;
      gitlab = false;
      kind = false;
      k8s = false;
    };
  };

  services.openssh.enable = true;

  # For now here until i find better method of mounting these. The goal is to
  # it auto mount when it detects my home network, or via a simple command.
  fileSystems."/mnt/wynnic" = {
    device = "10.0.0.9:/volume1/homes/jona";
    fsType = "nfs";
    options = [
      "x-systemd.automount"
      "noauto"
    ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
