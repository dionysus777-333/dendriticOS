{ inputs, ... }: {
  flake.modules.nixos.yir = {
    imports = with inputs.self.modules.nixos; [
      global
      headful
      baseware
      ./_hardware-configuration.nix
      normalKeyb
    ];
    networking.hostName = "37e0b";
  };
  flake.modules.homeManager.yir = {
    imports = with inputs.self.modules.homeManager; [
      global
      headful
      baseware
    ];
  };
}
