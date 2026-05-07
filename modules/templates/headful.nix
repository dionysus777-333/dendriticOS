{ inputs, ... }:
{
  flake.modules.nixos.headful = { pkgs, ... }: {
    imports = with inputs.self.modules.nixos; [
      plymouth
      home-manager
      tuigreet
    ];
  };
  flake.modules.homeManager.headful = {
    imports = with inputs.self.modules.homeManager; [
      noctalia
      niri
      foot
      stylix
      fastfetch
      filetree
    ];
  };
}
