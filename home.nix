{ config, pkgs, lib, ... }:
with lib;

let dotfiles = pkgs.fetchFromGitHub {
  owner = "JonaVDM";
  repo = "dotfiles";
  rev = "5e9d389";

  # To update the sha256
  # $ nix-shell -p nix-prefetch-scripts
  # $ nix-prefetch-git https://github.com/jonavdm/dotfiles
  sha256 = "150wh7sqz3bpgf3s9j0c76bhzdgxpyd08qnl108f1mgxq5jlbbzg";
};
in {
  config = {
    dconf.settings = {
      "org/gnome/desktop/input-sources" = {
        xkb-options = [ "caps:escape" ];
      };
      "org/gnome/desktop/peripherals/keyboard" = {
        delay = "uint32 300";
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

    home.file = {
      ".p10k.zsh" = {
        source = "${dotfiles}/.p10k.zsh";
      };
      ".tmux.conf" = {
        source = "${dotfiles}/.tmux.conf";
      };
      ".zshrc" = {
        source = "${dotfiles}/.zshrc";
      };
      ".config/kitty" = {
        source = "${dotfiles}/kitty";
        recursive = true;
      };
      ".dotfiles/scripts" = {
        source = "${dotfiles}/scripts";
        recursive = true;
      };
    };

    programs.git = {
      enable = true;
      userName = "Jonathan van der Meulen";
      userEmail = "32264711+JonaVDM@users.noreply.github.com";
    };
  };
}
