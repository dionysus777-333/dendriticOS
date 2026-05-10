{
  flake.modules.homeManager.hyprland = {
    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      systemd.enable = true;
      settings = {
        # Variables
        "$mod" = "SUPER";
        "$terminal" = "foot";
        "$menu" = "fuzzel";
        "$browser" = "librewolf";

        # env = [
        #   "XCURSOR_THEME,Vanilla-DMZ"
        #   "XCURSOR_SIZE,24"
        #   "HYPRCURSOR_THEME,Vanilla-DMZ"
        #   "HYPRCURSOR_SIZE,24"
        # ];

        decoration = {
          rounding = 0;
          shadow = { enabled = false; };
          blur = { enabled = false; };
        };
        animations = { enabled = false; };

        monitor = [
          ", preferred, auto, auto"
        ];

        input = {
          accel_profile="flat";
          repeat_delay = 300; 
          repeat_rate = 50;
          touchpad = {
            natural_scroll = true;
          };
        };
        gestures = {
          gesture = [ "3, horizontal, workspace" ];
        };

        general = {
          gaps_in = 3;
          gaps_out = 3;
          border_size = 2;
          resize_on_border = false;
          allow_tearing = false;
          layout = "dwindle";
        };

        misc = {
          force_default_wallpaper = 0;
          disable_hyprland_logo = true;
        };

        bind =
          [
            # Spawns
            "$mod, Q, killactive,"
            "$mod, W, exec, $browser"
            "$mod, RETURN, exec, $terminal"
            "$mod SHIFT, s, exec, grimblast copy area"
            "$mod SHIFT, l, exec, swaylock"
            "$mod, SPACE, exec, $menu"

            # Nav
            "$mod, H, movefocus, l"
            "$mod, L, movefocus, r"
            "$mod, J, movefocus, u"
            "$mod, K, movefocus, d"
            "$mod, F, fullscreen, 0"

            # Windows
            "$mod, V, togglefloating,"
            "$mod SHIFT, H, movewindow, l"
            "$mod SHIFT, L, movewindow, r"
            "$mod SHIFT, K, movewindow, u"
            "$mod SHIFT, J, movewindow, d"
            "$mod, M, fullscreen, 1"
          ]
          ++ (
            # workspaces
            # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
            builtins.concatLists (builtins.genList (i:
                let ws = i + 1;
                in [
                  "$mod, code:1${toString i}, workspace, ${toString ws}"
                  "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
                ]
              )
              9)
          );
        binde = [
          "$mod, equal, resizeactive, 20 0"
          "$mod, minus, resizeactive, -20 0"
          "$mod SHIFT, equal, resizeactive, 0 20"
          "$mod SHIFT, minus, resizeactive, 0 -20"
        ];
        bindel = [
          ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
          ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
          ", XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
          ", XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
        ];

        bindl = [
          ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ", XF86AudioPlay, exec, playerctl play-pause"
          ", XF86AudioNext, exec, playerctl next"
          ", XF86AudioPrev, exec, playerctl previous"
        ];

        # Mouse Bindings
        bindm = [
          "$mod, mouse:272, movewindow"
          "$mod, mouse:273, resizewindow"
        ];
        exec-once = [
          "foot -e sh -c 'fastfetch; $SHELL'"
          "waybar &"
          "swayidle -w"
        ];
      };
    };
  };
}
