{  pkgs, ... }:

{
  imports = [
    ./zsh.nix
    ./tmux.nix
  ];

  home.packages = with pkgs; [
    ripgrep
    neovim
    nix-prefetch-git
    gcc
    jq
    zoxide
    curl
    gh
    glab
    htop
    btop
    bat
    kubectl
    tldr
    pandoc
    just
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

