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
        layout = {
          gaps = 4;
          focus-ring = {
            width = 2;
          };
        };
        input = {
          touchpad = {
            tap = true;
            dwt = true;
            # natural-scroll = true;
            accel-speed = 0.2; 
            accel-profile = "adaptive";
            scroll-method = "two-finger";
            click-method = "clickfinger";
          };
          mouse = {
            # natural-scroll = true;
            accel-profile = "flat";
          };
        };
        binds = {
          # General
          "Mod+Shift+E".action.quit = [];
          "Mod+Shift+Slash".action.show-hotkey-overlay = [];
          "Mod+T".action.toggle-column-tabbed-display = [];
          "Mod+Shift+S".action.screenshot = [];
          # Spawns
          "Mod+Return".action.spawn = "foot";
          "Mod+W".action.spawn = "librewolf";
          "Mod+Q".action.close-window = [];
          "Mod+D".action.spawn-sh = [ "noctalia-shell ipc call lockScreen lock" ];
          "Mod+Space".action.spawn-sh = [ "noctalia-shell ipc call launcher toggle" ];
          # Windows/Columns
          "Mod+M".action.maximize-column = [];
          "Mod+F".action.fullscreen-window = [];
          "Mod+Shift+F".action.expand-column-to-available-width = [];
          "Mod+V".action.toggle-window-floating = [];
          "Mod+Shift+V".action.switch-focus-between-floating-and-tiling = [];
          "Mod+H".action.focus-column-left = [];
          "Mod+J".action.focus-window-down = [];
          "Mod+K".action.focus-window-up = [];
          "Mod+L".action.focus-column-right = [];
          # Sizing
          "Mod+BracketLeft".action.consume-window-into-column = [];
          "Mod+BracketRight".action.expel-window-from-column = [];
          "Mod+Minus".action.set-column-width = "-10%";
          "Mod+Equal".action.set-column-width = "+10%";
          "Mod+Shift+Minus".action.set-window-height = "-10%";
          "Mod+Shift+Equal".action.set-window-height = "+10%";
          "Mod+C".action.center-column = [];
          "Mod+R".action.switch-preset-column-width = [];
          "Mod+Shift+R".action.switch-preset-window-height = [];
          "Mod+Ctrl+R".action.reset-window-height = [];
          # Move Windows/Columns
          "Mod+Shift+H".action.move-column-left = [];
          "Mod+Shift+J".action.move-window-down = [];
          "Mod+Shift+K".action.move-window-up = [];
          "Mod+Shift+L".action.move-column-right = [];
          # Workspaces
          "Mod+1".action.focus-workspace = 1;
          "Mod+2".action.focus-workspace = 2;
          "Mod+3".action.focus-workspace = 3;
          "Mod+4".action.focus-workspace = 4;
          "Mod+5".action.focus-workspace = 5;
          "Mod+6".action.focus-workspace = 6;
          "Mod+7".action.focus-workspace = 7;
          "Mod+8".action.focus-workspace = 8;
          "Mod+9".action.focus-workspace = 9;
          "Mod+0".action.focus-workspace = 10;
          # Move Workspaces
          "Mod+Shift+1".action.move-column-to-workspace = 1;
          "Mod+Shift+2".action.move-column-to-workspace = 2;
          "Mod+Shift+3".action.move-column-to-workspace = 3;
          "Mod+Shift+4".action.move-column-to-workspace = 4;
          "Mod+Shift+5".action.move-column-to-workspace = 5;
          "Mod+Shift+6".action.move-column-to-workspace = 6;
          "Mod+Shift+7".action.move-column-to-workspace = 7;
          "Mod+Shift+8".action.move-column-to-workspace = 8;
          "Mod+Shift+9".action.move-column-to-workspace = 9;
          "Mod+Shift+0".action.move-column-to-workspace = 10;
        };
        spawn-at-startup = [
          {
            command = [
              "noctalia-shell"
            ];
          }
        ];
        window-rules = [
          {
            geometry-corner-radius = {
              bottom-left = 20.0;
              bottom-right = 20.0;
              top-left = 20.0;
              top-right = 20.0;
            };
            clip-to-geometry = true;
          }
        ];
      };
    };        
  };
}
