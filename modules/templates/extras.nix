{ inputs, ... }:
{
  flake.modules.nixos.extras = {
    modules = with inputs.self.modules.nixos; [
      spotify
      electrum
      feather
      kdePackages.kiten
      libreoffice
      obs
      prismlauncher
      ungoogled-chromium
      nemo
    ];
    services.flatpak.packages = [
      "org.equicord.equibop"
    ];
    virtualisation.virtualbox.host.enable = true;
    users.extraGroups.vboxusers.members = [ "user" ];
  };
}
