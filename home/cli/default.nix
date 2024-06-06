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
    imv
    jq
    just
    ncspot
    neovim
    nix-prefetch-git
    nnn
    pandoc
    ripgrep
    tldr
    unzip
    zathura
    zip
  ];

  programs = {
    git = {
      enable = true;
      userName = "Jonathan van der Meulen";
      userEmail = "32264711+JonaVDM@users.noreply.github.com";
      extraConfig = {
        commit = {
          template = "~/.gitmessage";
          gpgsign = "true";
        };
        gpg.format = "ssh";
        init.defaultBranch = "main";
        push.autoSetupRemote = "true";
        user.signingkey = "~/.ssh/id_ed25519.pub";
      };
    };

    fzf = {
      enable = true;
    };

    ssh = {
       enable = true;
    };
  };

  home.file."scripts/tmux-switcher.sh" = {
    text = ''
      # Inspired by:
      # https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/bin/tmux-sessionizer

      if [[ $# -eq 1 ]]; then
          selected=$1
      else
          selected=$((find ~/Code -type d -name "*.git" -print -prune; find ~ -maxdepth 1 -mindepth 1 -type d; find ~/.config -maxdepth 1 -type d) | while read dir; do if [[ $dir == *"/.git"* ]]; then dirname "$dir"; else echo "$dir"; fi; done | fzf)
      fi

      if [[ -z $selected ]]; then
          exit 0
      fi

      selected_name=$(basename "$selected" | tr . _)
      tmux_running=$(pgrep tmux)

      if [[ -z $tmux_running ]]; then
        tmux new -s $selected_name -c $selected
        exit 0
      fi

      tmux has-session -t=$selected_name 2> /dev/null
      if [[ $? == 1 ]]; then
        if [[ -z $TMUX ]]; then
          tmux new -s $selected_name -c $selected
          exit 0
        fi
        tmux new-session -d -s $selected_name -c $selected
      else
        if [[ -z $TMUX ]]; then
          tmux attach -t $selected_name
          exit 0
        fi
      fi
      tmux switch-client -t $selected_name
    '';

    executable = true;
  };
}
