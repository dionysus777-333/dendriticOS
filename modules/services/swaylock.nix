{
  flake.modules.homeManager.swaylock = {
    programs.swaylock = {
      enable = true;
      settings = {
        indicator-idle-visible = false;
        indicator-radius = 100;
        show-failed-attempts = true;
      };
    };
  };
}
