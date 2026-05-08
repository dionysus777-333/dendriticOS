{
  inputs,
  self,
  ...
}:
{
  flake.modules.nixos.yir =
    { config, ... }:
    {
      imports = [
        self.modules.nixos.user 
      ];
    };
}
