{
  self,
  ...
}:
{
  flake.modules.nixos.purlexia = { config, ... }: {
    imports = [
      self.modules.nixos.user 
    ];
    home-manager.users.user = {
      wayland.windowManager.hyprland.settings = {
        device = {
          name = "elan0676:00-04f3:3195-touchpad";
          accel_profile = "adaptive";
          sensitivity = 0.0;
        };
        monitor = {
          #output = "eDP-1"; mode = "1920x1200@60.00100"; position = "auto"; scale = "1";
        };
      };
    };
  };
}

