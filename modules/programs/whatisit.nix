# modules/programs/whatisit.nix
{ inputs, ... }:
{
  # flake-file collects inputs from any submodule and writes them to flake.nix
  flake-file.inputs = {
    whatisit = {
      url = "github:ThorOdinson246/whatisit-nl2sh";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # System-level package module
  flake.modules.nixos.whatisit = { pkgs, ... }: {
    environment.systemPackages = [
      inputs.whatisit.packages.${pkgs.system}.default
    ];
  };
}
