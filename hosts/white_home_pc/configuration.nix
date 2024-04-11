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

  networking.hostName = "white";

  # Enable networking
  networking.networkmanager.enable = true;

  users.users.jona.extraGroups = [ "networkmanager" "wheel" ];

  wm.gnome = true;
  common.nvidia = true;
  common.docker = true;

  home-manager.users.jona.wm.gnome = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
