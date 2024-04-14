{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    clock24 = true;
    baseIndex = 1;
    escapeTime = 0;
    keyMode = "vi";
    shortcut = "s";
    terminal = "tmux-256color";
    customPaneNavigationAndResize = true;
    plugins = with pkgs; [
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.nord
      tmuxPlugins.sensible
    ];

    extraConfig = ''
      set -g mouse on
      set-option -g detach-on-destroy off
      set -ag terminal-overrides ",xterm-256color:RGB"
      
      unbind '"'
      unbind %
      unbind s

      bind v split-window -c "#{pane_current_path}"
      bind s split-window -h -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"
      bind ] choose-session

      bind-key -n ^F5 switch-client -p
      bind-key -n ^F6 switch-client -n

      bind-key -r f run-shell 'tmux neww -n TmuxSwitcher "sh ~/scripts/tmux-switcher.sh"'
      bind-key -n ^F9  run-shell 'sh ~/scripts/tmux-switcher.sh ~/Code'
    '';
  };

}
