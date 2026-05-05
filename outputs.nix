# outputs.nix  
inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } {  
  imports = [  
    inputs.home-manager.flakeModules.home-manager  
  ];  
    
  systems = import inputs.systems;  
    
  perSystem = { pkgs, ... }: {  
  };  
}
