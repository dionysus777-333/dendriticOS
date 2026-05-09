{ inputs, ... }:
{
  flake.modules.homeManager.river = {
    wayland.windowManager.river = {
      enable = true;
      xwayland.enable = true;
      systemd.enable = true;
      settings = {
        # Config
        declare-mode = [
          "locked"
          "normal"
          "passthrough"
        ];
        default-layout = "rivertile";
        set-repeat = "50 300";

        # Inputs
        input = {
          # "type:touchpad" = {
          #   natural-scroll = "enabled";
          #   tap = "enabled";
          # };
          "*Mouse*" = {
            accel-profile = "flat"; # This disables mouse acceleration
            pointer-accel = 0.0;    # 0.0 is the default neutral speed
          }; 
        };
        map = {
          normal = {
            # Spawns
            "Super W" = "spawn 'librewolf'";
            "Super Return" = "spawn foot";
            "Control+Shift L" = "spawn swaylock";
            "Super Space" = "spawn fuzzel";

            "Super+Shift E" = "exit";
            "Super Q" = "close";
            
            # Navigation
            "Super J" = "focus-view up";
            "Super K" = "focus-view down";
            "Super H" = "focus-view left";
            "Super L" = "focus-view right";
            "Super+Shift J" = "swap up";
            "Super+Shift K" = "swap down";
            "Super+Shift H" = "swap left";
            "Super+Shift L" = "swap right";
            # "Super Period" = "focus-view next";
            # "Super Comma" = "focus-view previous";
            # "Super+Shift Period" = "send-to-output next";
            # "Super+Shift Comma" = "send-to-output previous";
            "Super+Shift Return" = "zoom";
            
            # Layout Control 
            "Super minus" = "resize horizontal -100";
            "Super equal" = "resize horizontal 100";
            "Super+Shift equal" = "resize vertical 100";
            "Super+Shift minus" = "resize vertical -100";
            "Super bracketleft" = "send-layout-cmd rivertile 'main-ratio -0.05'";
            "Super bracketright" = "send-layout-cmd rivertile 'main-ratio +0.05'";
            # "Super+Shift" = "send-layout-cmd rivertile 'main-count +1'";
            # "Super+Shift" = "send-layout-cmd rivertile 'main-count -1'";
            
            # Layout Orientation
            "Super Up"    = "send-layout-cmd rivertile 'main-location top'";
            "Super Right" = "send-layout-cmd rivertile 'main-location right'";
            "Super Down"  = "send-layout-cmd rivertile 'main-location bottom'";
            "Super Left"  = "send-layout-cmd rivertile 'main-location left'";

            # Window Management
            "Super+Alt H" = "move left 100";
            "Super+Alt J" = "move down 100";
            "Super+Alt K" = "move up 100";
            "Super+Alt L" = "move right 100";
            
            "Super+Alt+Control H" = "snap left";
            "Super+Alt+Control J" = "snap down";
            "Super+Alt+Control K" = "snap up";
            "Super+Alt+Control L" = "snap right";
            
            "Super+Alt+Shift H" = "resize horizontal -100";
            "Super+Alt+Shift J" = "resize vertical 100";
            "Super+Alt+Shift K" = "resize vertical -100";
            "Super+Alt+Shift L" = "resize horizontal 100";

            "Super V" = "toggle-float";
            "Super F" = "toggle-fullscreen";
            
            # Mode Toggles
            "Super F11" = "enter-mode passthrough";
            
            # Tags (0 = All tags)
            "Super 0" = "set-focused-tags 4294967295";
            "Super+Shift 0" = "set-view-tags 4294967295";
          } // (
            let
              # Helper function to calculate 2^(exp)
              pow = base: exp: if exp <= 0 then 1 else base * pow base (exp - 1);
            in
            builtins.listToAttrs (builtins.concatMap (i:
              let 
                tags = pow 2 (i - 1);
              in [
                { name = "Super ${toString i}"; value = "set-focused-tags ${toString tags}"; }
                { name = "Super+Shift ${toString i}"; value = "set-view-tags ${toString tags}"; }
                { name = "Super+Control ${toString i}"; value = "toggle-focused-tags ${toString tags}"; }
                { name = "Super+Shift+Control ${toString i}"; value = "toggle-view-tags ${toString tags}"; }
              ]
            ) (builtins.genList (x: x + 1) 9)) 
          );
          passthrough = {
            "Super F11" = "enter-mode normal";
          };

          # Media keys for both normal and locked modes
          locked = {
            "None XF86Eject" = "spawn 'eject -T'";
            "None XF86AudioRaiseVolume" = "spawn 'pamixer -i 5'";
            "None XF86AudioLowerVolume" = "spawn 'pamixer -d 5'";
            "None XF86AudioMute" = "spawn 'pamixer --toggle-mute'";
            "None XF86AudioMedia" = "spawn 'playerctl play-pause'";
            "None XF86AudioPlay" = "spawn 'playerctl play-pause'";
            "None XF86AudioPrev" = "spawn 'playerctl previous'";
            "None XF86AudioNext" = "spawn 'playerctl next'";
            "None XF86MonBrightnessUp" = "spawn 'light -A 5'";
            "None XF86MonBrightnessDown" = "spawn 'light -U 5'";
          };
        };
        # Rules
        rule-add = {
        };
        set-cursor-warp = "on-output-change";

        # Startup
        spawn = [
          "waybar"
          "'foot --hold fastfetch'"
          "'rivertile -view-padding 6 -outer-padding 6'"
        ];

        # Mouse
        focus-follows-cursor = "always";
      };
    };
  };
}
