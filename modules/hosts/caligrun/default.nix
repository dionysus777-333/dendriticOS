# hosts/yir/default.nix
{ inputs, ... }:
{
  flake.nixosConfigurations = inputs.self.lib.mkNixos "x86_64-linux" "caligrun";
}
