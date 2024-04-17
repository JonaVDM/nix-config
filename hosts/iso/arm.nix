{ pkgs, modulesPath, ... }:

{
  # WIP - not functional yet
  #
  # This is a really "minimal" install image for the raspberry pi, just with
  # some sensible defaults, tools, and config to get started.
  # This config should bring up the node with the user `admin` (who has access
  # to sudo) with password `secret`.
  #
  # This image was made and tested for the pi 4b, might work for other pi's.
  # but no garuantees are being given.
  #
  # Huge thanks to these resources for bootstrappnig this process
  # https://blog.janissary.xyz/posts/nixos-install-custom-image

  imports = [
    "${builtins.fetchGit { url = "https://github.com/NixOS/nixos-hardware.git"; }}/raspberry-pi/4"
  ];

  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_rpi4;
    # initrd.availableKernelModules = [ "xhci_pci" "usbhid" "usb_storage" ];
    initrd.availableKernelModules = [ "xhci_pci" "usbhid" ];
    loader.grub.enable = false;
    loader.generic-extlinux-compatible.enable = true;
  };

  fileSystems."/" = {
  device = "/dev/disk/by-label/NIXOS_SD"; # this is important!
    fsType = "ext4";
    options = [ "noatime" ];
  };

  services.openssh.enable = true;
  networking.hostName = "pi-cake";

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
