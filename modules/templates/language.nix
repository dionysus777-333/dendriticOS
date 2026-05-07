{ inputs, ... }:
{
  flake.modules.nixos.language = { pkgs, ... }: {
    modules = with inputs.self.modules.nixos; [
      anki
      fcitx5
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
}
