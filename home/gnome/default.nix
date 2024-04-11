{ lib, ... }:

{
  dconf.settings = {
    #
    # Settings
    #
    "org/gnome/desktop/input-sources" = {
      "xkb-options" = [ "caps:escape" ];
    };
    "org/gnome/desktop/wm/preferences" = {
      "button-layout" = "appmenu:minimize,maximize,close";
    };
    "org/gnome/desktop/lockdown" = {
      "disable-lock-screen" = false;
    };
    "org/gnome/desktop/interface" = {
      "color-scheme" = "prefer-dark";
    };
    "org/gnome/desktop/notifications" = {
      "show-in-lock-screen" = false;
    };
    "org/gnome/mutter" = {
      "edge-tiling" = true;
      "dynamic-workspaces" = true;
    };
    "org/gnome/shell/app-switcher" = {
      "current-workspace-only" = true;
    };
    "org/gnome/settings-daemon/plugins/power" = {
      "sleep-inactive-ac-type" = "nothing";
    };
    "org/gnome/desktop/peripherals/mouse" = {
      "accel-profile" = "flat";
    };
    "org/gnome/desktop/peripherals/keyboard" = {
      "delay" = lib.hm.gvariant.mkUint32 380;
      "repeat-interval" = lib.hm.gvariant.mkUint32 20;
    };
    
    #
    # Keybindings
    #
    "org/gnome/desktop/wm/keybindings" = {
      "switch-applications" = [];
      "switch-applications-backward" = [];
      "switch-windows" = ["<Alt>Tab"]; 
      "switch-windows-backward" = ["<Shift><Alt>Tab"]; 
      "toggle-fullscreen" = ["<Super>f"];
      "switch-to-workspace-1" = ["<Super>1"];
      "switch-to-workspace-2" = ["<Super>2"];
      "switch-to-workspace-3" = ["<Super>3"];
      "switch-to-workspace-4" = ["<Super>4"];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      "binding" = "<Super>Return"; 
      "command" = "alacritty";
      "name" = "Open Terminal";
    };
    "org/gnome/settings-daemon/plugins/media-keys" = {
      "custom-keybindings" = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
      ];
      "help" = [];
    };

    "org/gnome/shell/keybindings" = {
      "switch-to-application-1" = [];
      "switch-to-application-2" = [];
      "switch-to-application-3" = [];
      "switch-to-application-4" = [];
    };

    #
    # Plguins
    #
    "org/gnome/shell" = {
      "disable-user-extensions" = false;
      "enabled-extensions" = [
        "launch-new-instance@gnome-shell-extensions.gcampax.github.com"
        "blur-my-shell@aunetx"
      ];
    };
  };
}
