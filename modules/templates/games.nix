{ inputs, ... }:
{
  flake.modules.nixos.games = {
    imports = with inputs.self.modules.nixos; [
      steam
      osu
      # retroarch
      # prismLauncher
    ];
  };
}

