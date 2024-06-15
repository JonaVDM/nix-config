{ pkgs, lib, config, ... }:

{
  options.j.wm = {
    sway = lib.mkEnableOption "enable sway";
  };

  config = lib.mkIf config.j.wm.sway {
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
  };
}
