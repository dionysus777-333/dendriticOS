{
  flake.modules.homeManager.waybar = {
    programs.waybar = {
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          spacing = 5;

          modules-left = [
            "custom/logo"
          ];
          
          modules-center = [
            # "river/tags"
            "hyprland/workspaces"
          ];
          
          modules-right = [
            "tray"
            "cpu"
            "memory"
            "network"
            "wireplumber"
            "battery"
            "clock"
            # "custom/power"
          ];

          # "river/tags" = {
          #   num-tags = 9;
          #   hide-vacant = true;
          #   disable-click = true;
          # };

          # "river/window" = {
          #   format = "{}";
          #   max-length = 50;
          # };

          "memory" = {
            interval = 5;
            format = " {}%";
            # max-length = 10;
            on-click = "foot -e btop";
          };

          "cpu" = {
            interval = 5;
            format = " {}%";
            states = {
              warning = 70;
              critical = 90;
            };
            on-click = "foot -e btop";
          };

          "tray" = {
            spacing = 10;
          };

          "clock" = {
            tooltip-format = "{calendar}";
            format-alt = " {:%a, %m %d %Y}";
            format = " {:%H:%M}";
          };

          "network" = {
            format-wifi = "{icon}";
            format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
            format-ethernet = "󰀂";
            format-alt = "󱛇";
            format-disconnected = "󰖪";
            tooltip-format-wifi = "{icon} {essid}\n⇣{bandwidthDownBytes} ⇡{bandwidthUpBytes}";
            tooltip-format-ethernet = "󰀂 {ifname}\n⇣{bandwidthDownBytes} ⇡{bandwidthUpBytes}";
            tooltip-format-disconnected = "Disconnected";
            on-click-right = "foot -e nmtui";
            # on-click-right = "~/.config/rofi/wifi/wifinew.sh &";
            interval = 5;
          };

          "wireplumber" = {
            format = "{icon}";
            format-bluetooth = "󰂰";
            tooltip-format = "Volume : {volume}%";
            format-muted = "󰝟";
            format-icons = {
              headphone = "";
              default = ["󰖀" "󰕾" ""];
            };
            on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
            scroll-step = 1;
          };

          "custom/logo" = {
            format = "  ";
            tooltip = false;
            on-click = "nwg-bar";
            # on-click = "~/.config/rofi/launchers/misc/launcher.sh &";
          };

          "battery" = {
            format = "{capacity}% {icon}";
            format-icons = {
              charging = ["󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅"];
              default = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
            };
            format-full = "Charged ";
            interval = 5;
            states = {
              warning = 20;
              critical = 10;
            };
            tooltip = false;
          };

          "custom/power" = {
            format = "󰤆 ";
            tooltip = false;
            # on-click = "~/.config/rofi/powermenu/type-2/powermenu.sh &";
          };
        };
      };
    };
  };
}
