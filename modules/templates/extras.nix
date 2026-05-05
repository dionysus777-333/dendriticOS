{ inputs, ... }:
{
  flake.modules.nixos.extras = {
    modules = with inputs.self.modules.nixos; [
      spotify
    ];
  };
}
