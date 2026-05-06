{ inputs, ... }:
{
  flake.modules.nixos.global = { pkgs, ... }: {
    modules = with inputs.self.modules.nixos; [
      zsh
      git
    ];
    home-manager.users.user = {
      home.username = "user"; 
      home.homeDirectory = "/home/user";
      home.stateVersion = "25.11";
    };
    environment.systemPackages = with inputs.pkgs; [
      vim
      wget
      htop
      ffmpeg
      gh
      unzip
      unrar
      tree
      nix-tree
      bc
      jq
      nix-prefetch-github
    ];
    networking.networkmanager.enable = true;
    nixpkgs.config.allowUnfree = true;
    hardware.bluetooth.enable = true;
    services.power-profiles-daemon.enable = true;
    services.upower.enable = true;
    users.users.user = {
      isNormalUser = true;
      description = "user";
      shell = pkgs.zsh;
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [];
    };
  };
}
