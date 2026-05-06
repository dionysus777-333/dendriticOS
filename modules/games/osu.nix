{
  flake.modules.nixos.osu = {
    services.flatpak.packages = [ "sh.ppy.osu" ];
  };
}
