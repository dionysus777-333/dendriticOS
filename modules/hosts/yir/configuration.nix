{ inputs, ... }: {
  flake.nixosModules.yirConf = { ... }: {
    imports = with inputs.self.modules.nixos; [
      global
      headful
      baseware
      ./_hardware-configuration.nix
      normalKeyb
    ];
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
  };
}
