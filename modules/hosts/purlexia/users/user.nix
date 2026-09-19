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
        ];
      };
    };
  };
}

