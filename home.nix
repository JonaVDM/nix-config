{ config, pkgs, lib, ... }:
with lib;

{
  config = {
    dconf.settings = {
      "org/gnome/desktop/input-sources" = {
        xkb-options = [ "caps:escape" ];
      };
      "org/gnome/desktop/peripherals/keyboard" = {
        delay = "unit32 300";
	      repeat = "unit32 35";
      };
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        name = "Open Terminal";
        binding = "<Super>t";
        command = "kitty";
      };
      "org/gnome/settings-daemon/plugins/media-keys" = {
        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        ];
      };
      "org/gnome/desktop/wm/preferences" = {
        button-layout = "appmenu:minimize,close";
      };
    };

    programs.git = {
      enable = true;
      userName = "Jonathan van der Meulen";
      userEmail = "32264711+JonaVDM@users.noreply.github.com";
    };
  };
}
