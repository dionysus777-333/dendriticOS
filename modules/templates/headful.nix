{ inputs, ... }:
{
  flake.modules.nixos.headful = {
    imports = with inputs.self.modules.nixos; [
      plymouth
      home-manager
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
