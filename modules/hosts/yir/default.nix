# hosts/yir/default.nix
{ inputs, ... }:
{
  flake.nixosConfigurations = inputs.self.lib.mkNixos "x86_64-linux" "yir";
  flake.homeConfigurations = inputs.self.lib.mkHomeManager "x86_64-linux" "yir";
}
