{ inputs, ... }:
{
  flake-file.inputs = {
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  flake.modules.homeManager.niri = {
    imports = [ inputs.niri.homeModules.niri ];
    programs.niri = {
      enable = true;
      settings = {
        binds = {
          "Mod+Enter".action.spawn = "foot";
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
