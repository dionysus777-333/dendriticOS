# modules/services/stylix.nix  
{ pkgs, inputs, lib, config, ... }:
{  
  flake-file.inputs = {  
    stylix = {
      url = "github:nix-community/stylix";
    };
  };  
  flake.modules.homeManager.stylix = {
    options.mySettings.fontSize = lib.mkOption {
      type = lib.types.int;
      default = 12;
    };
    config = {
      stylix = {
        enable = true;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/base16-grayscale-dark";
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
             sizes = config.mySettings.fontSize;
          };
        };
    };
  };
}
