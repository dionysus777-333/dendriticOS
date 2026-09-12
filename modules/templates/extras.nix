{ inputs, ... }:
{
  flake.modules.nixos.extras = { pkgs, ... }: {
    imports = with inputs.self.modules.nixos; [
      flatpak
    ];
    nixpkgs.config.permittedInsecurePackages = [
      "python3.14-ecdsa-0.19.2"
    ];
    environment.systemPackages = with pkgs; [
      feishin
      obs-studio
      electrum
      #electrum-ltc
      feather
      nicotine-plus
      sonobus
      vesktop
    ];
    services.flatpak.packages = [
      "org.jdownloader.JDownloader"
      "org.kde.krita"
      "org.bluej.BlueJ"
    ];
    hardware.opentabletdriver.enable = true;
    virtualisation.virtualbox.host.enable = true;
    users.extraGroups.vboxusers.members = [ "user" ];
  };
}
