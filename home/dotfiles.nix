{  pkgs, ... }:

let
 dotfiles = pkgs.fetchFromGitHub {
   owner = "jonavdm";
   repo = "dotfiles";
   rev = "2b9da42ed0750457284cb1f9fae57e9bfc910519";
   sha256 = "01ma81bb0lvqi43irha14sgm75miwyqz9gbmqrr8m1slmwvwx6b1";
  };

  nvimconfig = pkgs.fetchFromGitHub {
    owner = "jonavdm";
    repo = "neovim-config";
    rev = "09911bb0030ab50414fdc0bab23c29d3af6734ab";
    sha256 = "0hyyxspcvcv6g2f1mg6jm7l1rpq1fmy6700mg8w3pz1m34bcm09b";
  };
in
{
  home.file = {
    ".config/nvim" = {
      source = "${nvimconfig}";
      recursive = true;
    };

    ".p10k.zsh" = {
      source = "${dotfiles}/.p10k.zsh";
    };

    ".gitmessage" = {
      source = "${dotfiles}/.gitmessage";
    };

    ".config/alacritty/alacritty.toml" = {
      source = "${dotfiles}/.alacritty.toml";
    };

    ".background-image" = {
      source = "${dotfiles}/wallpapers/01.jpg";
    };
  };
}
