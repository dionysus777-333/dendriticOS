{ inputs, ... }:
{
  flake.modules.nixos.headful = { pkgs, ... }: {
    imports = with inputs.self.modules.nixos; [
      plymouth
      home-manager
      tuigreet
      stylix
    ];
    environment.systemPackages = with pkgs; [ 
      qt6.qtwayland 
      libxcb
      xcbutil
      xcbutilimage
      xcbutilkeysyms
      xcbutilrenderutil
      xcbutilwm
      libinput
    ];
    programs.xwayland.enable = true;
    services.xserver.enable = true;
    services.libinput.enable = true;
    environment.sessionVariables = {
      QT_QPA_PLATFORM = "wayland;xcb";
    };
  };
  flake.modules.homeManager.headful = {
    imports = with inputs.self.modules.homeManager; [
      noctalia
      niri
      foot
      fastfetch
    ];
  };
}
