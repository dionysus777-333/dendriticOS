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
        binds = {
          "Mod+Return".action.spawn = "foot";
          "Mod+W".action.spawn = "librewolf";
          "Mod+Q".action.quit.skip-confirmation = true;

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
