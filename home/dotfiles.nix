{  pkgs, ... }:

let
 dotfiles = pkgs.fetchFromGitHub {
   owner = "jonavdm";
   repo = "dotfiles";
   rev = "704317c42434c33e99ecef92a25c6fa52a392228";
   sha256 = "07154d705lrj8jj8l6wyb1jq2593pjcgfh5xscp8sb1ph8d7plkx";
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

    ".tmux.conf" = {
      source = "${dotfiles}/.tmux.conf";
    };

    ".gitmessage" = {
      source = "${dotfiles}/.gitmessage";
    };
  };
}
