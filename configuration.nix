{ config, pkgs, lib, ... }:

{
  imports =
    [
      <home-manager/nixos>
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  networking.hostName = "ice-wizzard";
  networking.networkmanager.enable = true;
  networking.interfaces.enp5s0.wakeOnLan.enable = true;

  time.timeZone = "Europe/Amsterdam";

  i18n.defaultLocale = "en_US.utf8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "nl_NL.utf8";
    LC_IDENTIFICATION = "nl_NL.utf8";
    LC_MEASUREMENT = "nl_NL.utf8";
    LC_MONETARY = "nl_NL.utf8";
    LC_NAME = "nl_NL.utf8";
    LC_NUMERIC = "nl_NL.utf8";
    LC_PAPER = "nl_NL.utf8";
    LC_TELEPHONE = "nl_NL.utf8";
    LC_TIME = "nl_NL.utf8";
  };

  # Enable gnome
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # User config
  users.users.jona = {
    isNormalUser = true;
    description = "jona";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      vscode
      spotify
      discord
      kitty
    ];
  };

  home-manager.users.jona = import ./home.nix;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    neovim
    neofetch
    tmux
    rustup
    rust-analyzer
    maven
    jdk
    gnumake
  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # On my home network i don't really care that much
  networking.firewall.enable = false;

  # Enable docker
  virtualisation = {
    docker = {
      enable = true;
      rootless = {
        enable = true;
      };
    };
  };


  # Don't we all love java
  programs.java.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}
