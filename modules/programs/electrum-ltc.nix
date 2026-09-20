{ ... }:
{
  flake.modules.nixos.electrum-ltc = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      electrum-ltc
    ];
    nixpkgs.config.permittedInsecurePackages = [
      "python3.14-ecdsa-0.19.2"
    ];
  };
}
