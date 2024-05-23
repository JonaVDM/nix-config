{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

  # Bootloader.
  boot.loader = {
    efi.canTouchEfiVariables = true;

    # systemd-boot.enable = true;
    grub = {
      enable = true;
      useOSProber = true;
      device = "nodev";
      efiSupport = true;
    };
  };

  # Enable networking
  networking.networkmanager.enable = true;

  networking.hostName = "deimos";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  users.users.jona.extraGroups = [ "networkmanager" "wheel" ];

  wm.gnome = false;
  wm.sway = true;

  common = {
    nvidia = false;
    bluetooth = true;

    docker = true;
    podman = false;
  };

  gaming = {
    steam = false;
  };

  dev = {
    dart = false;
    go = true;
    java = true;
    node = true;
    python = true;
    rust = false;

    frontend = false;
    generic_lsp = true;
    android = true;
  };

  iac = {
    ansible = true;
    azure = true;
    nix = true;
  };

  ops = {
    docker = true;
    gitlab = true;
    kind = false;
    k8s = false;
  };

  home-manager.users.jona = {
    wm.gnome = false;
    wm.sway = true;
  };

  # Enable CUPS to print documents.
  # services.printing.enable = true;


  # Enable the OpenSSH daemon.
  services.openssh.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
