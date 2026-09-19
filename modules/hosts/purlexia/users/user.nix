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
      };
    };
  };
}

