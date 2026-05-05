{ inputs, ... }:
{
  flake.modules.nixos.global = {
    modules = with inputs.self.modules.nixos; [
      anki
      fcitx5
    ];
  };
}
