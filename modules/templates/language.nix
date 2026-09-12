{ inputs, lib, ... }:
{
  flake.modules.nixos.language = { pkgs, ... }: {
    imports = with inputs.self.modules.nixos; [
      fcitx5
    ];
    environment.systemPackages = with pkgs; [
      kdePackages.kiten
    ];
  };
  flake.modules.homeManager.language = {
    imports = with inputs.self.modules.homeManager; [
      # anki
      fcitx5
    ];
    wayland.windowManager.hyprland.settings = {
      on = {
        _args = [
          "hyprland.start"
          (lib.generators.mkLuaInline ''
            function()
              hl.exec_cmd("fcitx5")
            end
          '')
        ];
      };
    };
  };
}
