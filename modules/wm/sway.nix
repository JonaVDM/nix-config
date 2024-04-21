{ pkgs, lib, config, ... }:

lib.mkIf(config.wm.sway)
{
  environment.systemPackages = with pkgs; [
    grim
    mako
    slurp
    wl-clipboard
    swayidle
  ];

  services.gnome.gnome-keyring.enable = true;

  programs.sway = {
    enable = true;

    wrapperFeatures.gtk = true;
  };
}
