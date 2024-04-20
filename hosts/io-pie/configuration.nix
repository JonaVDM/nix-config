{ pkgs, lib, ... }:

{
  # imports = [
  #   ./hardware-config.nix
  # ];

  boot = {
    initrd.availableKernelModules = [ "xhci_pci" "uas" "usbhid" "usb_storage" ];
    initrd.kernelModules = [ ];

    loader.grub.enable = false;
    loader.generic-extlinux-compatible.enable = true;
    kernelModules = [ ];
    extraModulePackages = [ ];
  };
  hardware.enableRedistributableFirmware = true;

  services.openssh.enable = true;

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
      options = [ "noatime" ];
    };
  };

  networking = {
    hostName = "io";
    useDHCP = true;
  };

  users.users.admin = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    hashedPassword = "$y$j9T$Hm9n1aAVfYzSnu0Nb9Dlp1$YhcWjEvH8OzsHLlRyVwh5KRI7WeJRY1At7wu1pPtcs8";
  };

  environment.systemPackages = with pkgs; [
    neofetch
    git
    wget
    vim
  ];

  nix.package = pkgs.nixFlakes;

  services.dnsmasq = {
    alwaysKeepRunning = true;
    enable = true;
    settings = {
      listen-address = [ "::1" "127.0.0.1" "10.0.0.96" ];
      server = [ "1.1.1.1" "8.8.8.8" ];
      address = [
        "/port.lego/10.0.0.2"
      ];
    };
  };

  networking.firewall.allowedTCPPorts = [ 53 ];
  networking.firewall.allowedUDPPorts = [ 53 ];

  nix.settings.trusted-users = [ "admin" ];
  nix.extraOptions = ''
    keep-outputs = true
    keep-derivations = true
    experimental-features = nix-command flakes
  '';

  nixpkgs.hostPlatform = lib.mkDefault "aarch64-linux";
  system.stateVersion = "23.11";
}
