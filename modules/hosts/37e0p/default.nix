# hosts/37e0p/default.nix
{ inputs, self, ... }: {
  imports = [
    ./hardware-configuration.nix
    self.nixModules.stylix
  ];
  networking.hostName = "37e0p";
}
