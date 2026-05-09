{
  flake.modules.homeManager.foot = {
    programs.foot = {
      enable = true;
      settings = {
        main = {
          # pad = "10x10";
        };
        # csd = {
        #   preferred = "none";
        #   size = 0;
        # };
      };
    };
  };
}
