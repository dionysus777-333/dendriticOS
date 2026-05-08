{ inputs, ... }: {
  flake.modules.nixos.yir = {
    imports = with inputs.self.modules.nixos; [
      system-default
      ./_hardware-configuration.nix
      normalKeyb
    ];
    networking.hostName = "37e0b";
  };
}
