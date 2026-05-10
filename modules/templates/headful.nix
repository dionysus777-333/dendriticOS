{ inputs, ... }:
{
  flake.modules.nixos.headful = { pkgs, ... }: {
    imports = with inputs.self.modules.nixos; [
      plymouth
      home-manager
      stylix
      wayland
    ];
    environment.systemPackages = with pkgs; [ 
      libxcb
      xcbutil
      xcbutilimage
      xcbutilkeysyms
      xcbutilrenderutil
      xcbutilwm
      libinput
    ];
    services.xserver.enable = true;
    services.libinput.enable = true;
  };
  flake.modules.homeManager.headful = { pkgs, ... }: {
    imports = with inputs.self.modules.homeManager; [
      fastfetch
      wayland
    ];
    # home.pointerCursor = {
    #   gtk.enable = true;
    #   x11.enable = true;
    # };
  };
}
