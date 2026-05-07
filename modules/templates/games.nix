{ inputs, ... }:
{
  flake.modules.nixos.games = {
    modules = with inputs.self.modules.nixos; [
      steam
      osu
      retroarch
    ];
  };
}

