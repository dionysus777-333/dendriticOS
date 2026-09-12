{ inputs, ... }:

{
  flake.modules.homeManager.hyprland = { pkgs, lib, ... }:

    let
      mkLuaInline = lib.generators.mkLuaInline;
      toLua = lib.generators.toLua;

      # Home Manager's Lua backend expects bindings as:
      # { _args = [ keys dispatcher options ]; }
      mkBind =
        keys: dispatcher: options:
        {
          _args = [
            keys
            dispatcher
            options
          ];
        };

      # Hyprland Lua dispatcher helpers.
      dsp = {
        exec = command:
          mkLuaInline "hl.dsp.exec_cmd(${toLua { } command})";

        focus = direction:
          mkLuaInline "hl.dsp.focus(${toLua { } { direction = direction; }})";

        close =
          mkLuaInline "hl.dsp.window.close()";

        kill =
          mkLuaInline "hl.dsp.window.kill()";

        move = direction:
          mkLuaInline "hl.dsp.window.move(${toLua { } { direction = direction; }})";

        drag =
          mkLuaInline "hl.dsp.window.drag()";

        resize =
          mkLuaInline "hl.dsp.window.resize()";

        fullscreen = mode:
          mkLuaInline "hl.dsp.window.fullscreen(${toLua { } mode}, 'toggle')";

        floating =
          mkLuaInline "hl.dsp.window.float({ action = 'toggle' })";

        workspace = workspace:
          mkLuaInline "hl.dsp.focus(${toLua { } { workspace = workspace; }})";

        movetoworkspace = workspace:
          mkLuaInline "hl.dsp.window.move(${toLua { } { workspace = workspace; }}, 'false')";

        resizeactive = 
          mkLuaInline "hl.dsp.window.resize()";
      };

      mod = "SUPER";
      terminal = "foot";
      menu = "fuzzel";
      browser = "librewolf";

      # Generate bindings for workspaces 1-9.
      workspaceBinds =
        builtins.concatLists (
          builtins.genList
            (i:
              let
                ws = i + 1;
                key = toString ws;
              in
              [
                (mkBind
                  "${mod} + ${key}"
                  (dsp.workspace ws)
                  { })

                (mkBind
                  "${mod} + SHIFT + ${key}"
                  (dsp.movetoworkspace ws)
                  { })
              ]
            )
            9
        );

    in
    {
      home.packages = with pkgs; [
        brightnessctl
        grimblast
        playerctl
      ];

      wayland.windowManager.hyprland = {
        enable = true;
        xwayland.enable = true;
        systemd.enable = true;

        # Generate ~/.config/hypr/hyprland.lua
        configType = "lua";

        settings = {
          #
          # Variables
          #
          # These become Lua locals:
          #
          # local mod = "SUPER"
          # local terminal = "foot"
          # local menu = "fuzzel"
          # local browser = "librewolf"
          #
          mod = {
            _var = mod;
          };

          terminal = {
            _var = terminal;
          };

          menu = {
            _var = menu;
          };

          browser = {
            _var = browser;
          };

          #
          # Appearance
          #
          config.decoration = {
            rounding = 0;

            shadow = {
              enabled = false;
            };

            blur = {
              enabled = false;
            };

            dim_inactive = true;
            dim_strength = 0.2;
          };

          animation = {
            leaf = "global";
            enabled = false;
          };

          #
          # Input
          #
          config.input = {
            accel_profile = "flat";
            repeat_delay = 300;
            repeat_rate = 50;

            touchpad = {
              natural_scroll = false;
            };
          };

          gesture = {
            fingers = 3; direction = "horizontal"; action = "workspace";
          };

          #
          # General
          #
          config.general = {
            gaps_in = 3;
            gaps_out = 3;
            border_size = 0;
            resize_on_border = false;
            allow_tearing = false;
            layout = "dwindle";
          };

          #
          # Dwindle
          #
          config.dwindle = {
            force_split = 2;
            preserve_split = true;
          };

          #
          # Misc
          #
          config.misc = {
            force_default_wallpaper = 0;
            disable_hyprland_logo = true;
            disable_splash_rendering = true;
          };

          #
          # Keybinds
          #
          bind = lib.flatten (
            [
              # Workspace binds

              workspaceBinds


              # Spawn / window management

              (mkBind
                "${mod} + Q"
                dsp.close
                { })

              (mkBind
                "${mod} + W"
                (dsp.exec browser)
                { })

              (mkBind
                "${mod} + RETURN"
                (dsp.exec terminal)
                { })

              (mkBind
                "${mod} + SHIFT + S"
                (dsp.exec "grimblast copy area")
                { })

              (mkBind
                "${mod} + SHIFT + D"
                (dsp.exec "loginctl lock-session")
                { })

              (mkBind
                "${mod} + SPACE"
                (dsp.exec menu)
                { })

              # Focus movement

              (mkBind
                "${mod} + H"
                (dsp.focus "l")
                { })

              (mkBind
                "${mod} + L"
                (dsp.focus "r")
                { })

              (mkBind
                "${mod} + J"
                (dsp.focus "d")
                { })

              (mkBind
                "${mod} + K"
                (dsp.focus "u")
                { })

              # Fullscreen

              (mkBind
                "${mod} + F"
                (dsp.fullscreen "fullscreen")
                { })

              (mkBind
                "${mod} + M"
                (dsp.fullscreen "maximized")
                { })

              # Floating

              (mkBind
                "${mod} + V"
                dsp.floating
                { })

              # Move windows

              (mkBind
                "${mod} + SHIFT + H"
                (dsp.move "l")
                { })

              (mkBind
                "${mod} + SHIFT + L"
                (dsp.move "r")
                { })

              (mkBind
                "${mod} + SHIFT + K"
                (dsp.move "u")
                { })

              (mkBind
                "${mod} + SHIFT + J"
                (dsp.move "d")
                { })


          # Volume / brightness

            (mkBind
              "XF86AudioRaiseVolume"
              (dsp.exec "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+")
              {
                repeating = true;
              })

            (mkBind
              "XF86AudioLowerVolume"
              (dsp.exec "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")
              {
                repeating = true;
              })

            (mkBind
              "XF86MonBrightnessUp"
              (dsp.exec "brightnessctl -e4 -n2 set 5%+")
              {
                repeating = true;
              })

            (mkBind
              "XF86MonBrightnessDown"
              (dsp.exec "brightnessctl -e4 -n2 set 5%-")
              {
                repeating = true;
              })

            (mkBind
              "XF86AudioMute"
              (dsp.exec "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")
              { })

            (mkBind
              "XF86AudioPlay"
              (dsp.exec "playerctl play-pause")
              { })

            (mkBind
              "XF86AudioNext"
              (dsp.exec "playerctl next")
              { })

            (mkBind
              "XF86AudioPrev"
              (dsp.exec "playerctl previous")
              { })
            (mkBind
              "${mod} + mouse:272"
              dsp.drag
              {
                mouse = true;
              })
            ]
          );
          #
          # Start Hyprland applications.
          #
          # Lua mode uses the Hyprland start event instead of
          # the old exec-once syntax.
          #
          on = {
            _args = [
              "hyprland.start"

              (mkLuaInline ''
                function()
                  hl.exec_cmd("waybar")
                  hl.exec_cmd("hypridle")
                end
              '')
            ];
          };
        };
      };
    };
}

