# outputs.nix  
inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } {  
  imports = [  
    inputs.home-manager.flakeModules.home-manager 
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
    }
    inputs.stylix.nixosModules.stylix
    inputs.nixvim.homeModules.nixvim
    inputs.niri.homeModules.niri
    inputs.nix-flatpak.nixosModules.nix-flatpak
  ];  
    
  systems = import inputs.systems;  
    
  perSystem = { pkgs, ... }: {  
  };  
}
