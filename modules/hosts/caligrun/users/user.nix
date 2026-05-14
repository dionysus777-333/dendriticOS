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
    };
  };
}
