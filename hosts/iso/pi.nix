# This is a really "minimal" install image for the raspberry pi, this config
# contains a template to be used when building something on the pi.
# This config should bring up the node with the user `admin` (who has access
# to sudo) with password `secret`.
#
# The raspberry pi used for testing this config is the 4b with 2gb of ram.
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
# - https://www.reddit.com/r/NixOS/comments/15nghxf/comment/jvlzu1q

{ pkgs, ... }:

let
  hostname = "nix-iso";
  username = "admin";

  # default to `secret`, generate a new using `mkpasswd`.
  password = "$y$j9T$Hm9n1aAVfYzSnu0Nb9Dlp1$YhcWjEvH8OzsHLlRyVwh5KRI7WeJRY1At7wu1pPtcs8";

  overlay = final: super: {
    makeModulesClosure = x:
    super.makeModulesClosure (x // { allowMissing = true; });
  };
in
{
  #
  # === System settings ===
  #
  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_rpi4;
    initrd.availableKernelModules = [ "xhci_pci" "usbhid" "usb_storage" ];
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };
  };

  fileSystems."/" = {
  device = "/dev/disk/by-label/NIXOS_SD";
    fsType = "ext4";
    options = [ "noatime" ];
  };

  nix = {
    package = pkgs.nixFlakes;

    gc = {
      automatic = true;
      dates = "*-*-* 12:00:00";
      options = "--delete-older-than 7d";
    };

    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };

    extraOptions = ''
      keep-outputs = true
      keep-derivations = true
      experimental-features = nix-command flakes
    '';

    settings.trusted-users = [ username ];
  };

  system.stateVersion = "23.11";
  hardware.enableRedistributableFirmware = true;
  nixpkgs = {
    hostPlatform = "aarch64-linux";
    overlays = [ overlay ];
  };

  #
  # === Networking ===
  #
  services.openssh.enable = true;
  networking = {
    hostName = hostname;
    useDHCP = true;
  };

  #
  # === User settings ===
  #
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];

    hashedPassword = password;
  };

  environment.systemPackages = with pkgs; [
    neovim
    wget
    git
  ];

  programs.zsh.enable = true;
  environment.variables = {
    SHELL = "zsh";
    EDITOR = "neovim";
  };
}
