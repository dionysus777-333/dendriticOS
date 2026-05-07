{ inputs, ... }:
{
  flake.modules.nixos.extras = {
    modules = with inputs.self.modules.nixos; [
      flatpak
      spotify
      electrum
      feather
      kdePackages.kiten
      libreoffice
      obs
      prismlauncher
      nemo
    ];
    services.flatpak.packages = [
      "org.equicord.equibop"
    ];
    virtualisation.virtualbox.host.enable = true;
    users.extraGroups.vboxusers.members = [ "user" ];
  };
}
