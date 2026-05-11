{ inputs, ... }: {
  flake.modules.nixos.purlexia = { lib, ... }: {
    imports = with inputs.self.modules.nixos; [
      system-default
      ./_hardware-configuration.nix
      normalKeyb
    ];
    networking.hostName = "i8992";
    stylix.fonts.sizes = {
      terminal = lib.mkForce 13;
      applications = lib.mkForce 14;
      popups = lib.mkForce 14;
      desktop = lib.mkForce 12;
    };
  };
}

