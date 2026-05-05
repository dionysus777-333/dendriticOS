{
  flake-file.inputs = {
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  flake.modules.nixos.niri = {
    home-manager.users.user = {
        
    };
  };
}
