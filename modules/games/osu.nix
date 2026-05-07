{ inputs, ... }:
{
  flake.modules.nixos.osu = {
    imports = [ inputs.self.modules.nixos.flatpak ];
    services.flatpak.packages = [ "sh.ppy.osu" ];
  };
}
