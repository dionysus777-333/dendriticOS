# modules/home-manager.nix  
{  
  flake-file.inputs = {  
    home-manager = {  
      url = "github:nix-community/home-manager";  
      inputs.nixpkgs.follows = "nixpkgs";  
    };  
  };  
}
