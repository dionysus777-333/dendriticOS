{ inputs, ... }:
{
  flake.modules.nixos.global = { pkgs, lib, ... }: {
    imports = with inputs.self.modules.nixos; [
      git
      home-manager
    ];
  };
  flake.modules.homeManager.global = {
    imports = with inputs.self.modules.homeManager; [
      zsh
    ];
  };
}
