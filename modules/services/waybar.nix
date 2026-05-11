{
  flake.modules.homeManager.waybar = {
    programs.waybar = {
      enable = true;
      style = 
        ''
          #workspaces button {
            border-radius: 0;
          }
        '';
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
            "custom/power"
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
            on-click = "foot -e htop";
          };

          "cpu" = {
            interval = 5;
            format = " {}%";
            states = {
              warning = 70;
              critical = 90;
            };
            on-click = "foot -e htop";
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
            format = " ";
            tooltip = false;
            on-click = "fuzzel";
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
            on-click = "bash -c 'SELECTION=$(printf \"1 - Lock\\n2 - Suspend\\n3 - Log out\\n4 - Reboot\\n5 - Reboot to UEFI\\n6 - Hard reboot\\n7 - Shutdown\" | fuzzel --dmenu -l 7 -p \"Power Menu: \"); case $SELECTION in *\"Lock\") hyprlock;; *\"Suspend\") systemctl suspend;; *\"Log out\")  hyprctl dispatch exit;; *\"Reboot\") systemctl reboot;; *\"Reboot to UEFI\") systemctl reboot --firmware-setup;; *\"Hard reboot\") pkexec sh -c \"echo b > /proc/sysrq-trigger\";; *\"Shutdown\") systemctl poweroff;; esac'";
            # on-click = "~/.config/rofi/powermenu/type-2/powermenu.sh &";
          };
        };
      };
    };
  };
}
