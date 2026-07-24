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
      vesktop
    ];
    services.flatpak.packages = [
      "org.jdownloader.JDownloader"
      "org.kde.krita"
    ];
    hardware.opentabletdriver.enable = true;
    virtualisation.virtualbox.host.enable = true;
    users.extraGroups.vboxusers.members = [ "user" ];
  };
}
