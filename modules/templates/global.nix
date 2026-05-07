{ inputs, ... }:
{
  flake.modules.nixos.global = { pkgs, ... }: {
    imports = with inputs.self.modules.nixos; [
      git
      flatpak
    ];
    environment.systemPackages = with pkgs; [
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
    services.resolved = {
      enable = true;
    };
    nixpkgs.config.allowUnfree = true;
    hardware.bluetooth.enable = true;
    services.power-profiles-daemon.enable = true;
    services.upower.enable = true;
    users.users.user = {
      isNormalUser = true;
      description = "user";
      shell = pkgs.zsh;
      ignoreShellProgramCheck = true;
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [];
    };
    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    virtualisation.vmVariant = {
      # following configuration is added only when building VM with build-vm
      virtualisation = {
        memorySize = 1024; # Use 1024MiB memory.
        cores = 2;
        graphics = true; # Boot the vm in a window.
        diskSize = 15000; # Virtual machine disk size in MB.
      };
    };
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    system.stateVersion = "25.11";
  };
  flake.modules.homeManager.global = {
    imports = with inputs.self.modules.homeManager; [
      zsh
    ];
    home.username = "user"; 
    home.homeDirectory = "/home/user";
    home.stateVersion = "25.11";
  };
}
