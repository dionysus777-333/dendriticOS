{
  flake.modules.homeManager.wlogout = { config, pkgs, ... }: {
    programs.wlogout = {
      enable = true;
      style = with config.lib.stylix.colors.withHashtag; 
        ''
          #shutdown {
            background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/shutdown.png"));
          }
          #reboot {
            background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/reboot.png"));
          }
          * {
            font-family: "${config.stylix.fonts.sansSerif.name}";
            transition: 20ms;
          }
          window {
            background-color: alpha(#{base00}, 0.5);
          }
          button {
            color: transparent;
            background-color: transparent;
            border: none;
            box-shadow: none;
          }
        '';
      layout = [
        {
          label = "lock";
          action = "swaylock";
          text = "Lock";
          keybind = "1";
        }
        {
          label = "logout";
          action = "loginctl terminate-user $USER";
          text = "Logout";
          keybind = "2";
        }
        {
          label = "suspend";
          action = "systemctl suspend";
          text = "Sleep";
          keybind = "3";
        }
        {
          label = "hibernate";
          action = "systemctl hibernate";
          text = "Hibernate";
          keybind = "4";
        }
        {
          label = "reboot";
          action = "systemctl reboot";
          text = "Restart";
          keybind = "5";
        }
        {
          label = "shutdown";
          action = "systemctl poweroff";
          text = "Shutdown";
          keybind = "6";
        }
        {
          label = "firmware";
          action = "systemctl reboot --firmware-setup";
          text = "Reboot to BIOS";
          keybind = "7";
        }
      ];
    };
  };
}
