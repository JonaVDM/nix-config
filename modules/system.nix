{ outputs, inputs, pkgs, ... }:

# A collection of (un)sensible settings
{
  time.timeZone = "Europe/Amsterdam";

  i18n.defaultLocale = "en_GB.UTF-8";

  hardware.pulseaudio.enable = false;
  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };

  nix.gc = {
    automatic = true;
    dates = "*-*-* 12:00:00";
    options = "--delete-older-than 7d";
  };

  # overlays
  nixpkgs = {
    overlays = [
      outputs.overlays.staging-next-packages
      inputs.nix-vscode-extensions.overlays.default
      inputs.nur.overlay
    ];
  };

  # Default packages needed
  environment.systemPackages = with pkgs; [
    vim
    nvfetcher
  ];
}
