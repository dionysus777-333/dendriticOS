# modules/services/stylix.nix  
{ inputs, ... }:
{  
  flake-file.inputs = {  
    stylix = {
      url = "github:nix-community/stylix";
    };
  };  
  flake.modules.nixos.stylix = { pkgs, ... }: {
    imports = [ inputs.stylix.nixosModules.stylix ];
    stylix = {
      enable = true;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/grayscale-dark.yaml";
      fonts = {
        serif = {
          package = pkgs.noto-fonts;
          name = "Noto Serif";
        };
        sansSerif = {
          package = pkgs.noto-fonts;
          name = "Noto Sans";
        };
        monospace = {
          package = pkgs.noto-fonts;
          name = "Noto Sans Mono";
        };
          emoji = {
            package = pkgs.noto-fonts-color-emoji;
            name = "Noto Color Emoji";
          };
        sizes = {
           applications = 12;
           terminal = 11;
           desktop = 10;
           popups = 12; 
        };
      };
      cursor = {
        package = pkgs.vanilla-dmz;
        name = "Vanilla-DMZ"; # Use "Vanilla-DMZ-AA" for the black version
        size = 24; 
      };
    };
  };
}
