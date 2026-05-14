{
  self,
  ...
}:
{
  flake.modules.nixos.yir = { config, ... }: {
    imports = [
      self.modules.nixos.user 
    ];
    home-manager.users.user = {
      imports = with self.modules.homeManager; [
        language
      ];
    };
  };
}
