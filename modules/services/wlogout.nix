{
  flake.modules.homeManager.wlogout = {
    programs.wlogout = {
      enable = true;
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
