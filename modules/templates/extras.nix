{ inputs, ... }:
{
  flake.modules.nixos.extras = { pkgs, ... }: {
    imports = with inputs.self.modules.nixos; [
      flatpak
    ];
    environments.systemPackages = with pkgs; [
      ncspot
      obs-studio
      electrum
      feather
    ];
    services.flatpak.packages = [
      "org.equicord.equibop"
    ];
    virtualisation.virtualbox.host.enable = true;
    users.extraGroups.vboxusers.members = [ "user" ];
  };
}
