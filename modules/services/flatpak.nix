# modules/services/flatpak.nix
{ lib, config, ... }:
{
  flake-file.inputs = { 
    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };
  flake.modules.nixos.flatpak = {
    services.flatpak = {
      enable = true;
      uninstallUnmanaged = true;
    };
  };
}
