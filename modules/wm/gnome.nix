{ pkgs, lib, config, ... }:

{
  options.j.wm = {
    gnome = lib.mkEnableOption "enable gnome";
  };

  config = lib.mkIf config.j.wm.gnome {
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
  };
}
