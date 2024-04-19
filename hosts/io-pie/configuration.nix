{ pkgs, ... }:

{
  imports = [
    ./hardware-config.nix
  ];

  boot = {
    loader.grub.enable = false;
    loader.generic-extlinux-compatible.enable = true;
  };

  services.openssh.enable = true;

  networking = {
    hostName = "pi-cake";
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
  ];

  nix.package = pkgs.nixFlakes;

  services.dnsmasq = {
    alwaysKeepRunning = true;
    enable = true;
    settings = {
      listen-address = [ "::1" "127.0.0.1" "10.0.0.96" ];
      server = [ "1.1.1.1" "8.8.8.8" ];
      address = [ "/port.lego/10.0.0.2" ];
    };
  };

  nix.settings.trusted-users = [ "admin" ];
  nix.extraOptions = ''
    keep-outputs = true
    keep-derivations = true
    experimental-features = nix-command flakes
  '';

  system.stateVersion = "23.11";
}
