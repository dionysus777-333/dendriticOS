{
  flake.modules.nixos.steam = { pkgs, ... }: {
    programs.steam = {
      enable = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
    programs.gamemode.enable = true;
    hardware.graphics.enable32Bit = true;
  };
}
