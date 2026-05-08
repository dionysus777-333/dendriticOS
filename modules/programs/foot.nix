{
  flake.modules.homeManager.foot = {
    programs.foot = {
      enable = true;
      settings = {
        csd = {
          preferred = "none";
          size = 0;
        };
      };
    };
  };
}
