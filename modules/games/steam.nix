{
  flake.modules.nixos.steam = { pkgs, ... }: {
    programs.steam = {
      enable = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
    programs.gamemode.enable = true;
    hardware.graphics.enable32Bit = true;
    home-manager.users.user = {
      home.packages = with pkgs; [
        protonup-qt        # Easy way to install GE-Proton
        mangohud           # Performance overlay
        gamemode           # Optimization tool
        bottles            # For non-Steam Windows games
        gamescope
      ];
      programs.mangohud = {
        enable = true;
        settings = {
          fps_limit = 144;
          cpu_temp = true;
          gpu_temp = true;
        };
      };
    };
  };
}
