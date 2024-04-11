{  pkgs, ... }:

let
  gen = pkgs.callPackage ../../_sources/generated.nix { }; 
in
{
  home.file = {
    ".config/nvim" = {
      source = "${gen.nvim.src}";
      recursive = true;
    };

    ".p10k.zsh" = {
      source = "${gen.dotfiles.src}/.p10k.zsh";
    };

    ".gitmessage" = {
      source = "${gen.dotfiles.src}/.gitmessage";
    };

    ".config/alacritty/alacritty.toml" = {
      source = "${gen.dotfiles.src}/.alacritty.toml";
    };

    ".background-image" = {
      source = "${gen.dotfiles.src}/wallpapers/01.jpg";
    };
  };
}
