{
  flake.modules.homeManager.hyprlock = {
    programs.hyprlock = {
      enable = true;
      settings = {
        general = {
          hide_cursor = true;
          ignore_empty_input = true;
        };

        animations = {
          enabled = false;
        };

        # background = [
        #   {
        #   }
        # ];

        # input-field = [
        #   {
        #     size = "200, 50";
        #     position = "0, -80";
        #     monitor = "";
        #     dots_center = true;
        #     fade_on_empty = true;
        #     outline_thickness = 5;
        #     # placeholder_text = '\'<span foreground="##cad3f5">Password...</span>'\';
        #     rounding = 0;
        #   }
        # ];
      };
    };
  };
}
