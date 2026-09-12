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
          output = ""; mode = "preferred"; position = "auto"; scale = "auto";
        };
      };
    };
  };
}
