# hosts/yir/default.nix
{ inputs, ... }:
{
  flake.nixosConfigurations.yir = {
    system = "x86_64-linux";
    modules = with inputs.self.modules.nixos; [
      yirConf
    ];
  };
}
