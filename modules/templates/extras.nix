{ inputs, ... }:
{
  flake.modules.nixos.extras = { pkgs, ... }: {
    imports = with inputs.self.modules.nixos; [
      flatpak
    ];
    nixpkgs.config.permittedInsecurePackages = [
      "python3.13-ecdsa-0.19.1"
    ];
    environment.systemPackages = with pkgs; [
      feishin
      obs-studio
      electrum
      electrum-ltc
      feather
      nicotine-plus
      legcord
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
