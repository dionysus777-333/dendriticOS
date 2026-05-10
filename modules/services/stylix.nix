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
          package = pkgs.dejavu_fonts;
          name = "DejaVu Serif";
        };
        sansSerif = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Sans";
        };
        monospace = {
          package = pkgs.nerd-fonts.jetbrains-mono;
          name = "JetBrainsMono Nerd Font";
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
