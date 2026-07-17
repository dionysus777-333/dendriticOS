{ inputs, ... }:
{
  flake.modules.nixos.extras = { pkgs, ... }: {
    imports = with inputs.self.modules.nixos; [
      flatpak
    ];
    environment.systemPackages = with pkgs; [
      ncspot
      obs-studio
      electrum
      feather
      equibop
    ];
    services.flatpak.packages = [
      "org.jdownloader.JDownloader"
      "org.kde.krita"
    ];
    virtualisation.virtualbox.host.enable = true;
    users.extraGroups.vboxusers.members = [ "user" ];
  };
}
