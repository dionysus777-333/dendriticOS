{ inputs, ... }:
{
  flake.modules.nixos.language = { pkgs, ... }: {
    imports = with inputs.self.modules.nixos; [
      fcitx5
    ];
    environment.systemPackages = with pkgs; [
      kdePackages.kiten
    ];
    fonts.packages = with pkgs; [ 
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif 
    ];
  };
  flake.modules.homeManager.language = {
    imports = with inputs.self.modules.homeManager; [
      # anki
      fcitx5
    ];
  };
}
