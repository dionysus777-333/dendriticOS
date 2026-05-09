{
  inputs,
  ...
}:
{
  # default settings needed for all nixosConfigurations

  flake.modules.nixos.system-minimal =
    { pkgs, ... }:
    {
      # Module Imports
      imports = [ inputs.self.modules.nixos.global ];
      # System Packages
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

      # Networking
      networking.networkmanager.enable = true;
      services.resolved.enable = true;
      networking.firewall.enable = true;

      # Software
      hardware.enableRedistributableFirmware = true;
      nixpkgs.config.allowUnfree = true;
      system.stateVersion = "26.05";

      # Boot
      boot.loader.systemd-boot.enable = true;
      boot.initrd.systemd.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;

      # Locale
      i18n.defaultLocale = "en_US.UTF-8";
      time.timeZone = "America/Los_Angeles";
      
      nix.settings = {

        experimental-features = [
          "nix-command"
          "flakes"
        ];

        download-buffer-size = 1024 * 1024 * 1024;

        trusted-users = [
          "root"
          "@wheel"
        ];
      };

      nix.extraOptions = ''
        warn-dirty = false
        keep-outputs = true
      '';

    };
}
