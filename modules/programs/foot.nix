{
  flake.modules.nixos.foot = {
    home-manager.users.user = {
      programs.foot = {
        enable = true;
        cursor = {
          style = "block";
          blink = "yes";
        };
        mouse = {
          hide-when-typing = "yes";
        };
        key-bindings = {
          scrollback-up-page = "Shift+Page_Up";
          scrollback-down-page = "Shift+Page_Down";
        };
      };
    };
  };
}
