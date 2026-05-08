{
  inputs,
  self,
  ...
}:
{
  flake.modules.nixos.linux-desktop =
    { config, ... }:
    {
      home-manager.users.user = {
        ###
      };
    };
}
