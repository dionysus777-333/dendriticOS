{
  flake.modules.homeManager.swayidle = { pkgs, ... }: {
    services.swayidle = {
      enable = true;
      systemdTarget = "graphical-session.target";
      timeouts = [
        {
          timeout = 300; # 5 minutes
          command = "${pkgs.swaylock-effects}/bin/swaylock";
        }
        {
          timeout = 600;
          # Turns off all monitors via wlr-randr
          command = "${pkgs.wlr-randr}/bin/wlr-randr --off";
          # Restores all monitors on activity resume
          resumeCommand = "${pkgs.wlr-randr}/bin/wlr-randr --on";
        }
      ];
      events = [
        {
          event = "before-sleep";
          command = "${pkgs.swaylock-effects}/bin/swaylock";
        }
      ];
    };
  };
}
