{
  flake.modules.nixos.normalKeyb = {
    services.keyd = {
      enable = true;
      keyboards = {
        default = {
          ids = [ "*" ];
          settings = {
            main = {
              capslock = "leftmeta";
              leftmeta = "capslock";
            };
          };
        };
      };
    };
  };
}
