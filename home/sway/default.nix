{ config, lib, pkgs, ... }:

lib.mkIf config.wm.sway
{
  home.packages = with pkgs; [
    swayidle
    grim
    mako
    playerctl
    slurp
    waybar
    wl-clipboard
  ];

  home.file.".config/sway/config".text = ''
    #
    # Variables
    #
    set $mod Mod4

    set $left h
    set $down j
    set $up k
    set $right l

    set $term alacritty
    set $menu dmenu_path | wmenu | xargs swaymsg exec --
    set $browser firefox

    #
    # wallpaper
    #
    # output * bg @datadir@/backgrounds/sway/Sway_Wallpaper_Blue_1920x1080.png fill
    output * bg #000000 solid_color

    #
    # Idle configuration
    #
    # Example configuration:
    #
    # exec swayidle -w \
    #          timeout 300 'swaylock -f -c 000000' \
    #          timeout 600 'swaymsg "output * power off"' resume 'swaymsg "output * power on"' \
    #          before-sleep 'swaylock -f -c 000000'
    #
    # This will lock your screen after 300 seconds of inactivity, then turn off
    # your displays after another 300 seconds, and turn your screens back on when
    # resumed. It will also lock your screen before your computer goes to sleep.

    #
    # Input configuration
    #
    input "type:keyboard" {
      repeat_delay 200
      repeat_rate 50
      xkb_layout us
      xkb_options caps:escape,compose:ralt
    }

    #
    # Key bindings
    #

    # Start a terminal
    bindsym $mod+Return exec $term

    bindsym $mod+b exec $browser

    # Kill focused window
    bindsym $mod+Shift+q kill

    # Start your launcher
    bindsym $mod+d exec $menu

    bindsym $mod+Alt+l exec swaylock -c 000000

    # Drag floating windows by holding down $mod and left mouse button.
    # Resize them with right mouse button + $mod.
    # Despite the name, also works for non-floating windows.
    # Change normal to inverse to use left mouse button for resizing and right
    # mouse button for dragging.
    floating_modifier $mod normal

    # Reload the configuration file
    bindsym $mod+Shift+c reload

    # Exit sway (logs you out of your Wayland session)
    bindsym $mod+Shift+e exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'

    # Move your focus around
    bindsym $mod+$left focus left
    bindsym $mod+$down focus down
    bindsym $mod+$up focus up
    bindsym $mod+$right focus right

    # Move the focused window with the same, but add Shift
    bindsym $mod+Shift+$left move left
    bindsym $mod+Shift+$down move down
    bindsym $mod+Shift+$up move up
    bindsym $mod+Shift+$right move right

    # Switch to workspace
    bindsym $mod+1 workspace number 1
    bindsym $mod+2 workspace number 2
    bindsym $mod+3 workspace number 3
    bindsym $mod+4 workspace number 4
    bindsym $mod+5 workspace number 5
    bindsym $mod+6 workspace number 6
    bindsym $mod+7 workspace number 7
    bindsym $mod+8 workspace number 8
    bindsym $mod+9 workspace number 9
    bindsym $mod+0 workspace number 10

    # Move focused container to workspace
    bindsym $mod+Shift+1 move container to workspace number 1
    bindsym $mod+Shift+2 move container to workspace number 2
    bindsym $mod+Shift+3 move container to workspace number 3
    bindsym $mod+Shift+4 move container to workspace number 4
    bindsym $mod+Shift+5 move container to workspace number 5
    bindsym $mod+Shift+6 move container to workspace number 6
    bindsym $mod+Shift+7 move container to workspace number 7
    bindsym $mod+Shift+8 move container to workspace number 8
    bindsym $mod+Shift+9 move container to workspace number 9
    bindsym $mod+Shift+0 move container to workspace number 10

    # Media control
    bindsym XF86AudioMute exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    bindsym XF86AudioRaiseVolume exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+
    bindsym XF86AudioLowerVolume exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-

    bindsym XF86AudioStop exec playerctl -a stop
    bindsym XF86AudioPrev exec playerctl -a previous
    bindsym XF86AudioNext exec playerctl -a next
    bindsym XF86AudioPlay exec playerctl -a play-pause

    # You can "split" the current object of your focus with
    # $mod+b or $mod+v, for horizontal and vertical splits
    # respectively.
    # bindsym $mod+b splith
    # bindsym $mod+v splitv

    # Switch the current container between different layout styles
    # bindsym $mod+s layout stacking
    # bindsym $mod+w layout tabbed
    # bindsym $mod+e layout toggle split

    # Make the current focus fullscreen
    bindsym $mod+f fullscreen

    # Toggle the current focus between tiling and floating mode
    bindsym $mod+Shift+space floating toggle

    # Swap focus between the tiling area and the floating area
    bindsym $mod+space focus mode_toggle

    # Move focus to the parent container
    bindsym $mod+a focus parent

    # Sreenshots
    bindsym $mod+Print exec grim - | wl-copy
    bindsym $mod+Shift+Print exec grim -g "$(slurp)" - | wl-copy

    bindsym $mod+r mode "resize"
    mode "resize" {
        bindsym $left resize shrink width 10px
        bindsym $down resize grow height 10px
        bindsym $up resize shrink height 10px
        bindsym $right resize grow width 10px

        # Return to default mode
        bindsym Return mode "default"
        bindsym Escape mode "default"
    }

    # Move the currently focused window to the scratchpad
    bindsym $mod+Shift+minus move scratchpad

    # Show the next scratchpad window or hide the focused scratchpad window.
    # If there are multiple scratchpad windows, this command cycles through them.
    bindsym $mod+minus scratchpad show

    #
    # Status Bar:
    #
    bar {
      swaybar_command waybar
        # position top
        #
        # status_command while ~/.config/sway/bar.sh; do sleep 1; done
        #
        # colors {
        #     statusline #ffffff
        #     background #323232
        #     inactive_workspace #32323200 #32323200 #5c5c5c
        # }
    }

    exec mako

    include @sysconfdir@/sway/config.d/*
  '';
}
