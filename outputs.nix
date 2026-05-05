# outputs.nix  
inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } {  
  imports = [  
    inputs.home-manager.flakeModules.home-manager 
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
    }
    inputs.stylix.nixosModules.stylix
  ];  
    
  systems = import inputs.systems;  
    
  perSystem = { pkgs, ... }: {  
  };  
}
