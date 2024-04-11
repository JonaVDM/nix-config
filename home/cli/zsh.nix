{ pkgs, ... }:

{
  programs.zsh  = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;

    shellAliases = {
      update-dotfiles = ''
        cd ~/.nix-config &&
        nvfetcher &&
        git add _sources &&
        git commit -m "chore(nvfetcher): update sources"
      '';
      update = "sudo nixos-rebuild switch --flake ~/.nix-config";
      gaa = "git add .";
      gcm = "git commit -m";
      gp = "git push";
      gl = "git pull";
      gf = "git fetch -a";
      glog = "git log --oneline --decorate --graph";
      glg = "git log --stat";
      gst = "git status";
      gch = "git checkout";
      gfgl = "git fetch && git pull";
      clean = "git reset --hard && git clean -f";
      ls = "ls --color=auto";
      lsa = "ls -lah";
      l = "ls -lah";
      ll = "ls -lh";
      la = "ls -lAh";
      dcd = "docker compose down";
      dcu = "docker compose up --build";
      dcud = "docker compose up --build -d";
      dce = "docker compose exec";
      dcl = "docker compose logs";
      dcw = "docker compose up --watch";
      v = "nvim";
      pm = "pnpm";
      cl = "clear";
      kc = "kubectl";
      git-fix = "git config remote.origin.fetch '+refs/heads/*:refs/remotes/origin/*'";
      cd = "z";
    };

    plugins = [
      {
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
      }

      {
        file = "share/zsh-users/zsh-autosuggestions.zsh";
        name = "zsh-autosuggestions";
        src = pkgs.zsh-autosuggestions;
      }

      {
        file = "share/zsh-users/zsh-syntax-highlighting.zsh";
        name = "zsh-syntax-highlighting";
        src = pkgs.zsh-syntax-highlighting;
      }

      {
        file = "shre/zsh-users/zsh-completions.zsh";
        name = "zsh-completions";
        src = pkgs.zsh-completions;
      }

      {
        file = "shre/joshskidmore/zsh-fzf-history-search";
        name = "zsh-fzf-history-search";
        src = pkgs.pkgs.zsh-fzf-history-search;
      }
    ];

    sessionVariables = {
      EDITOR = "nvim";
      ZSH_FZF_HISTORY_SEARCH_FZF_EXTRA_ARGS = "--height 20";
    };

    history = {
      size = 100000;
    };

    initExtra = ''
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
      eval "$(zoxide init zsh)"

      setopt hist_ignore_all_dups
      setopt hist_reduce_blanks
      setopt inc_append_history
      setopt share_history
    '';
  };
}
