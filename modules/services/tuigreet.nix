{
  flake.modules.nixos.tuigreet = { pkgs, ... }: {
    # imports = [ pkgs.tuigreet ]; 
    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd start-hyprland";
          user = "greeter";
        };
      };
    }; 
  };
}
