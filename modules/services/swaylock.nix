{
  flake.modules.homeManager.swaylock = { pkgs, ... }: {
    programs.swaylock = {
      enable = true;
      package = pkgs.swaylock-effects;
      settings = {
        clock = true;
        indicator = true;
        indicator-idle-visible = false;
        indicator-radius = 50;
        indicator-thickness = 7;
        show-failed-attempts = true;
      };
    };
  };
}
