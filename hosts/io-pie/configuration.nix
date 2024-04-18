{ pkgs, ... }:

{
  imports = [
    ./hardware-config.nix
  ]

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
}
