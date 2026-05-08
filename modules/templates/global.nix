{ inputs, ... }:
{
  flake.modules.nixos.global = { pkgs, lib, ... }: {
    imports = with inputs.self.modules.nixos; [
      git
      home-manager
    ];
  };
}
