{
  flake.modules.homeManager.hyprland = { pkgs, ... }: {
    home.packages = with pkgs; [ brightnessctl ];
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
          dim_inactive = true;
          dim_strength = 0.2;
        };
        animations = { enabled = false; };

        monitor = [
        ];

        input = {
          accel_profile="flat";
          repeat_delay = 300; 
          repeat_rate = 50;
          touchpad = {
            natural_scroll = false;
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

        dwindle = {
          force_split = 2;
          preserve_split = true;
        };

        misc = {
          force_default_wallpaper = 0;
          disable_hyprland_logo = true;
        };

        bind =
          [
            # Spawns
            # "$mod, code:24, killactive"                     # Q
            # "$mod, code:25, exec, $browser"                  # W
            # "$mod, code:36, exec, $terminal"                 # RETURN
            # "$mod SHIFT, code:39, exec, grimblast copy area" # S
            # "$mod SHIFT, code:40, exec, loginctl lock-session"            # L
            # "$mod, code:65, exec, $menu"                     # SPACE

            # # Nav
            # "$mod, code:43, movefocus, l"                    # H
            # "$mod, code:46, movefocus, r"                    # L
            # "$mod, code:44, movefocus, d"                    # J
            # "$mod, code:45, movefocus, u"                    # K
            # "$mod, code:41, fullscreen, 0"                   # F

            # # Windows
            # "$mod, code:55, togglefloating"                  # V
            # "$mod SHIFT, code:43, movewindow, l"             # H
            # "$mod SHIFT, code:46, movewindow, r"             # L
            # "$mod SHIFT, code:45, movewindow, u"             # K
            # "$mod SHIFT, code:44, movewindow, d"             # J
            # "$mod, code:58, fullscreen, 1"                   # M

            # Spawns
            "$mod, Q, killactive,"
            "$mod, W, exec, $browser"
            "$mod, RETURN, exec, $terminal"
            "$mod SHIFT, s, exec, grimblast copy area"
            "$mod SHIFT, d, exec, loginctl lock-session"
            "$mod, SPACE, exec, $menu"

            # Nav
            "$mod, H, movefocus, l"
            "$mod, L, movefocus, r"
            "$mod, J, movefocus, d"
            "$mod, K, movefocus, u"
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
          "waybar &"
          "hypridle"
        ];
      };
    };
  };
}
