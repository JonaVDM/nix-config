{ pkgs, modulesPath, ... }:

{
  # This is a really "minimal" install image for the raspberry pi, just with
  # some sensible defaults, tools, and config to get started.
  # This config should bring up the node with the user `admin` (who has access
  # to sudo) with password `secret`.
  #
  # This image was made and tested for the pi 4b, might work for other pi's.
  # but no garuantees are being given.
  #
  # Since there is no base config being copied to the pi it is recommended to
  # create a new flake profile for the host, and to build/push that from a
  # different machine.
  #
  # In order to build this image(and to create updates for the Pi's), the host
  # needs to be able to build for the aarch64-linux platform. This can be done
  # with the following config
  # boot.binfmt.emulatedSystems = [
  #   "aarch64-linux"
  # ];
  #
  # Sources:
  # - https://blog.janissary.xyz/posts/nixos-install-custom-image
  # - https://github.com/peeley/dotfiles/tree/master/.config/nixos

  boot = {
    kernelModules = [ ];
    extraModulePackages = [ ];
    initrd.availableKernelModules = [ "xhci_pci" "usbhid" "usb_storage" ];
    loader.grub.enable = false;
    loader.generic-extlinux-compatible.enable = true;
  };

  fileSystems."/" = {
  device = "/dev/disk/by-label/NIXOS_SD";
    fsType = "ext4";
    options = [ "noatime" ];
  };
  swapDevices = [ ];

  services.openssh.enable = true;

  networking = {
    hostName = "pi-cake";
    useDHCP = true;
  };

  users.users.admin = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];

    # default to `secret`, generate a new using `mkpasswd`.
    hashedPassword = "$y$j9T$Hm9n1aAVfYzSnu0Nb9Dlp1$YhcWjEvH8OzsHLlRyVwh5KRI7WeJRY1At7wu1pPtcs8";
  };

  environment.systemPackages = with pkgs; [
    neovim
    wget
    git
  ];

  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    keep-outputs = true
    keep-derivations = true
    experimental-features = nix-command flakes
  '';

  nix.settings.trusted-users = [ "admin" ];
  programs.zsh.enable = true;
  environment.variables = {
    SHELL = "zsh";
    EDITOR = "neovim";
  };

  system.stateVersion = "23.11";

  nixpkgs.hostPlatform = "aarch64-linux";
}
