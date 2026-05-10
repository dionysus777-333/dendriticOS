{
  flake.modules.nixos.nwg-bar = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      nwg-bar
    ];
  };
}
