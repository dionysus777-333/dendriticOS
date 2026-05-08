{ inputs, ... }:
{
  flake-file.inputs = {
    niri = {
      url = "github:sodiboo/niri-flake";
    };
  };
  flake.modules.homeManager.niri = {
    imports = [ inputs.niri.homeModules.niri ];
    programs.niri = {
      enable = true;
      settings = {
        input = {
          touchpad = {
            tap = true;
            dwt = true;
            natural-scroll = true;
            accel-speed = 0.2; 
            accel-profile = "adaptive";
            scroll-method = "two-finger";
            click-method = "clickfinger";
          };
          mouse = {
            natural-scroll = true;
            accel-profile = "flat";
          };
        };
        binds = {
          "Mod+Return".action.spawn = "foot";
          "Mod+W".action.spawn = "librewolf";
          "Mod+Q".action.close-window = [];
          "Mod+D".action.spawn-sh = [ "noctalia-shell ipc call lockScreen lock" ];
          "Mod+Space".action.spawn-sh = [ "noctalia-shell ipc call launcher toggle" ];
          "Mod+M".action.maximize-column = [];
        };
        spawn-at-startup = [
          {
            command = [
              "noctalia-shell"
            ];
          }
        ];
      };
    };        
  };
}
