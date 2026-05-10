{ inputs, ... }:
{
  flake.modules.nixos.wayland = { pkgs, ... }: {
    imports = with inputs.self.modules.nixos; [
      tuigreet
      nwg-bar
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
  };
  flake.modules.homeManager.wayland = {
    imports = with inputs.self.modules.homeManager; [
      foot
      swaylock
      waybar
      fuzzel
      hyprland
      # river
      # wlogout
      # noctalia
      # niri
    ] ;
  };
}
