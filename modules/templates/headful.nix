{ inputs, ... }:
{
  flake.modules.nixos.global = {
    modules = with inputs.self.modules.nixos; [
      filetree 
      stylix
      niri
      noctalia-shell
      foot
      fastfetch
      plymouth
    ];
  };
}
