{ lib, config, pkgs, ... }:

{
  options.j.dev = {
    tools = lib.mkEnableOption "Enable cli tools";
  };

  config = lib.mkIf config.j.dev.tools {
    environment.defaultPackages = with pkgs; [
      bat
      btop
      curl
      gh
      glab
      htop
      hut
      imv
      jq
      just
      ncspot
      neovim
      nnn
      pandoc
      ripgrep
      tldr
      unzip
      zathura
      zip
    ];
  };
}
