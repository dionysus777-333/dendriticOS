{
  self,
  lib,
  ...
}:
let user = "user";
in
{
  flake.modules = lib.mkMerge [
    (self.factory.user "${user}" true)
    {
      nixos.${user} = {
        imports = with self.modules.nixos; [
          # developmentEnvironment
        ];
        users.users.${user} = {
          group = "audio";
        };
      };

      homeManager.${user} =
        { pkgs, ... }:
        {
          imports = with self.modules.homeManager; [
          ];
          home.packages = with pkgs; [
          ];
        };
    }
  ];
}
