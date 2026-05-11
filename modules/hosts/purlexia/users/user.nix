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
        device = [
          {
            name = "synaptics-tm2722-001";
            accel_profile = "adaptive";
          }
          {
            name = "tpps/2-ibm-trackpoint";
            accel_profile = "adaptive";
          }
        ];
      };
    };
  };
}

