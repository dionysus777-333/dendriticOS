{ inputs, ... }: {
  flake.modules.nixos.caligrun = {
    imports = with inputs.self.modules.nixos; [
      system-default
      ./_hardware-configuration.nix
      extras
      games
      language
    ];
    networking.hostName = "949r7";
  };
}
