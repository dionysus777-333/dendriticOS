{
  self,
  ...
}:
{
  flake.modules.nixos.purlexia =
    { config, ... }:
    {
      imports = [
        self.modules.nixos.user 
      ];
    };
}

