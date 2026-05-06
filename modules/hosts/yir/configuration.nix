{ inputs, ... }: {
  flake.modules.nixos.yir = {
    imports = with inputs.self.modules.nixos; [
      global
      headful
      baseware
      ./_hardware-configuration.nix
      normalKeyb
    ];
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    system.stateVersion = "25.11";
  };
}
