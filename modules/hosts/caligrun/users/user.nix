{
  self,
  ...
}:
{
  flake.modules.nixos.caligrun = { config, ... }: {
    imports = [
      self.modules.nixos.user 
    ];
    home-manager.users.user = {
      imports = with self.modules.homeManager; [
        language
      ];
      wayland.windowManager.hyprland.settings = {
        monitor = [
          "HDMI-A-1, 1920x1080@120, auto, auto"
        ];
      };
    };
  };
}
