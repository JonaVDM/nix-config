{  pkgs, ... }:

{
  imports = [
    ./zsh.nix
    ./tmux.nix
  ];

  home.packages = with pkgs; [
    bat
    btop
    curl
    gcc
    gh
    glab
    htop
    jq
    just
    ncspot
    neovim
    nix-prefetch-git
    pandoc
    ripgrep
    tldr
    zoxide
  ];

  programs.git = {
    enable = true;
    userName = "Jonathan van der Meulen";
    userEmail = "32264711+JonaVDM@users.noreply.github.com";
    extraConfig = {
      init.defaultBranch = "main"; 
      commit.template = "~/.gitmessage";
    };
  };

  programs.fzf = {
    enable = true;
  };

  programs.ssh = {
    enable = true;
  };
}

