# modules/home-manager.nix  
{ inputs, lib, ... }:  
{  
  flake-file.inputs = {  
    home-manager = {  
      url = "github:nix-community/home-manager";  
      inputs.nixpkgs.follows = "nixpkgs";  
    };  
  };  
}
