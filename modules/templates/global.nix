{ inputs, ... }:
{
  flake.modules.nixos.global = {
    modules = with inputs.self.modules.nixos; [
      zsh
      git
    ];
    home-manager.users.user = {
      home.username = "user"; 
      home.homeDirectory = "/home/user";
      home.stateVersion = "25.11";
    };
  };
}
