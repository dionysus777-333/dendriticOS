{ inputs, ... }:
{
  flake.modules.nixos.wayland = { pkgs, ... }: {
    imports = with inputs.self.modules.nixos; [
      tuigreet
    ];
    environment.systemPackages = with pkgs; [
      qt6.qtwayland
      grimblast
    ];
    programs.xwayland.enable = true;
    environment.sessionVariables = {
      QT_QPA_PLATFORM = "wayland;xcb";
    };
    security.pam.services.swaylock = {};

    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
    
  };
  flake.modules.homeManager.wayland = {
    imports = with inputs.self.modules.homeManager; [
      foot
      # swaylock
      hyprlock
      hypridle
      waybar
      fuzzel
      hyprland
      btop
      # river
      # wlogout
      # noctalia
      # niri
    ] ;
  };
}
