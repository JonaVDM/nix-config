{  pkgs, ... }:

{
  imports = [
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    ripgrep
    neovim
    alacritty
    nix-prefetch-git
    gcc
    nodejs
    go
    python3
    jq
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

  programs.tmux = {
    enable = true;
  };

  programs.ssh = {
    enable = true;
  };
}

