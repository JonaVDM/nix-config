{ pkgs, lib, config, ... }:

lib.mkIf config.wm.gnome
{
  services.xserver = {
    desktopManager.gnome.enable = true;

    # Enable the X11 windowing system.
    enable = true;

    # Enable the GNOME Desktop Environment.
    displayManager.gdm = {
      enable = true;
      autoSuspend = false;
    };

    # Configure keymap in X11
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  environment.systemPackages = with pkgs; [
    gnomeExtensions.blur-my-shell
    gnomeExtensions.tray-icons-reloaded
  ];
}
