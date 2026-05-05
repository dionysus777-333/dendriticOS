{ inputs, ... }:
{
  flake.modules.nixos.baseware = {
    modules = with inputs.self.modules.nixos; [
      librewolf
      nixvim
      demacsu
      keepassxc
      flatpak
    ];
  };
}

