{
  flake.modules.homeManager.foot = {
    programs.foot = {
      enable = true;
      settings = {
        main = {
          pad = "3x3";
        };
        # csd = {
        #   preferred = "none";
        #   size = 0;
        # };
      };
    };
  };
}
