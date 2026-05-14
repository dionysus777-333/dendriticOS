{ inputs, ... }:
{
  flake.modules.nixos.language = { pkgs, ... }: {
    imports = with inputs.self.modules.nixos; [
      fcitx5
    ];
    environments.systemPackages = with pkgs; [
      kdePackages.kiten
    ];
    i18n.inputMethod = {
      type = "fcitx5";
      enable = true;
      fcitx5.addons = with pkgs; [
        fcitx5-mozc
        fcitx5-gtk
      ];
    };
  };
  flake.modules.homeManager.language = {
    imports = with inputs.self.modules.homeManager; [
      anki
    ];
  };
}
