{ config, lib, pkgs, ... }:

lib.mkIf(config.wm.hyprland)
{
  # For those who are wondering: when you turn off notifications and rounded
  # corners etc, why not just use Sway.
  # And simply said, Sway with nixos and nvidia did not work. This did.
  home.packages = with pkgs; [
    grim
    hyprlock
    hyprpaper
    hypridle
    mako
    playerctl
    slurp
    waybar
    wl-clipboard
    wofi
    xdg-desktop-portal-gtk
  ];

  # Default config
  home.file.".config/hypr/hyprland.conf".text = ''
    exec-once=hyprpaper
    exec-once=mako
    exec-once=hypridle
    exec-once=waybar

    monitor=,preferred,auto,auto

    $terminal = alacritty
    $fileManager = dolphin
    $menu = wofi --show drun
    $browser = firefox
    $music = alacritty --command ncspot

    $mod = SUPER
    $up = K
    $down = J
    $left = L
    $right = H

    env = XCURSOR_SIZE,24
    env = QT_QPA_PLATFORMTHEME,qt5ct # change to qt6ct if you have that
    env = WLR_NO_HARDWARE_CURSORS,1

    # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
    input {
      kb_layout = us

      follow_mouse = 0

      touchpad {
          natural_scroll = false
      }

      sensitivity = 0
      kb_options=caps:escape

      repeat_delay = 200
      repeat_rate = 55

     sensitivity = 0.7
     accel_profile = flat
    }

    general {
      # See https://wiki.hyprland.org/Configuring/Variables/ for more

      gaps_in = 5
      gaps_out = 10
      border_size = 2
      col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
      col.inactive_border = rgba(595959aa)

      layout = dwindle

      # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
      allow_tearing = false
    }

    decoration {
      blur {
        enabled = true
        size = 3
        passes = 1

        vibrancy = 0.1696
      }

      drop_shadow = true
      shadow_range = 4
      shadow_render_power = 3
      col.shadow = rgba(1a1a1aee)
    }

    animations {
      enabled = false
    }

    dwindle {
      pseudotile = true
      preserve_split = true
    }

    master {
      new_is_master = true
      orientation = right
    }

    windowrulev2 = suppressevent maximize, class:.*

    bind = $mod, Return, exec, $terminal
    bind = $mod_SHIFT, Q, killactive,
    bind = $mod_SHIFT, Delete, exit,
    bind = $mod, E, exec, $fileManager
    bind = $mod, Space, exec, $menu
    bind = $mod, P, pseudo, # dwindle
    bind = $mod, B, exec, $browser
    bind = $mod, M, exec, $music
    bind = $mod_Ctrl, L, exec, hyprlock
    bind = $mod, F, fullscreen

    # Move focus with mod + arrow keys
    bind = $mod, $left, movefocus, l
    bind = $mod, $right, movefocus, r
    bind = $mod, $up, movefocus, u
    bind = $mod, $down, movefocus, d

    # Switch workspaces with mod + [0-9]
    bind = $mod, 1, workspace, 1
    bind = $mod, 2, workspace, 2
    bind = $mod, 3, workspace, 3
    bind = $mod, 4, workspace, 4
    bind = $mod, 5, workspace, 5
    bind = $mod, 6, workspace, 6
    bind = $mod, 7, workspace, 7
    bind = $mod, 8, workspace, 8
    bind = $mod, 9, workspace, 9
    bind = $mod, 0, workspace, 10

    # Move active window to a workspace with mod + SHIFT + [0-9]
    bind = $mod SHIFT, 1, movetoworkspace, 1
    bind = $mod SHIFT, 2, movetoworkspace, 2
    bind = $mod SHIFT, 3, movetoworkspace, 3
    bind = $mod SHIFT, 4, movetoworkspace, 4
    bind = $mod SHIFT, 5, movetoworkspace, 5
    bind = $mod SHIFT, 6, movetoworkspace, 6
    bind = $mod SHIFT, 7, movetoworkspace, 7
    bind = $mod SHIFT, 8, movetoworkspace, 8
    bind = $mod SHIFT, 9, movetoworkspace, 9
    bind = $mod SHIFT, 0, movetoworkspace, 10

    # Scroll through existing workspaces with mod + scroll
    bind = $mod, mouse_down, workspace, e+1
    bind = $mod, mouse_up, workspace, e-1

    # Move/resize windows with mod + LMB/RMB and dragging
    bindm = $mod, mouse:272, movewindow
    bindm = $mod, mouse:273, resizewindow

    # Media control
    bindel=, XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+
    bindel=, XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-
    bindl=, XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle

    bindl=, XF86AudioPlay, exec, playerctl play-pause
    bindl=, XF86AudioNext, exec, playerctl next
    bindl=, XF86AudioPrev, exec, playerctl previous

    bind = $mod, Print, exec, grim - | wl-copy
    bind = $mod_Shift, Print, exec, grim -g "$(slurp)" - | wl-copy
  '';


  home.file.".config/hypr/hyprpaper.conf" = {
    text = ''
      preload = ~/.background-image.jpg
      wallpaper = ,~/.background-image.jpg
      splash = false
    '';
  };

  home.file.".config/hypr/hyprlock.conf" = {
    text = ''
    background {
      color = rgb(25, 20, 20)

      blur_passes = 2 # 0 disables blurring
      blur_size = 7
      noise = 0.0117
      contrast = 0.8916
      brightness = 0.8172
      vibrancy = 0.1696
      vibrancy_darkness = 0.0
    }
    '';
  };

  home.file.".config/hypr/hypridle.conf" = {
    text = ''
    listener {
      timeout = 900
      on-timeout = hyprlock
    }
    '';
  };

  home.file.".config/waybar/config".text = ''
    [
      {
        "name": "menubar",
        "layer": "top",
        "position": "top",
        "modules-left": [
          "hyprland/workspaces",
          "hyprland/window"
        ],

        "modules-right": [
          "tray",
          "cpu",
          "memory",
          "pulseaudio#out",
          "pulseaudio#in",
          "clock",
        ],

        "clock": {
          "tooltip-format": "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>",
          "format-alt": "{:%Y-%m-%d}"
        },

        "pulseaudio#out": {
          "format": "{icon} {volume}%",
          "format-bluetooth": "{icon} {volume}% ",
          "format-bluetooth-muted": "{icon} {volume}",
          "format-muted": "<span color=\"#eb6f92\">ﱝ</span>",
          "format-icons": {
            "headphone": "",
            "default": [
              "",
              "",
              ""
            ]
          },
          "on-click": "pavucontrol"
        },

        "pulseaudio#in": {
          "format": "{format_source}",
          "format-source": "",
          "format-source-muted": "<span color=\"#eb6f92\"></span>",
          "on-click": "pactl set-source-mute @DEFAULT_SOURCE@ toggle"
        },

        "tray": {
          "spacing": 10
        },

        "sway/workspaces": {
          "persistent_workspaces": {
            "1": [],
            "2": [],
            "9": [],
            "10": []
          },
          "format": "{icon}",
          "format-icons": {
            "1": "",
            "2": "",
            "9": "󰙯",
            "10": "󰓇"
          }
        },

        "cpu": {
          "interval": 5,
          "format": " {usage}%",
        },

        "memory": {
          "interval": 5,
          "format": "󰍛 {}%",
        },
      }
    ]
  '';
}
