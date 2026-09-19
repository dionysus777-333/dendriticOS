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
        monitor = {
          output = "DP-1"; mode = "2560x1440@165"; position = "auto"; scale = "auto";
        };
      };
    };
  };
}
