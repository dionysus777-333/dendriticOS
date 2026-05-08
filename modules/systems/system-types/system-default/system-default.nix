{
  inputs,
  ...
}:
{
  # import all essential nix-tools which are used in all modules of a specific class

  flake.modules.nixos.system-default = { pkgs, lib, ... }: {
    hardware.bluetooth.enable = true;
    
    # Headful stuff
    services.power-profiles-daemon.enable = true;
    services.upower.enable = true;
    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    
    virtualisation.vmVariant = {
      # following configuration is added only when building VM with build-vm
      boot.initrd.luks.devices = lib.mkForce {}; 
      fileSystems."/" = lib.mkForce {
        device = "/dev/vda"; # Standard QEMU virtual disk
        fsType = "ext4";
      };
      virtualisation = {
        memorySize = 1024; # Use 1024MiB memory.
        cores = 2;
        graphics = true; # Boot the vm in a window.
        diskSize = 15000; # Virtual machine disk size in MB.
      };
    };

    
    imports =
      with inputs.self.modules.nixos;
      [
        system-minimal
        baseware
        headful
      ]
      ++ (with inputs.self.modules.generic; [
        systemConstants
      ]);
  };

  flake.modules.homeManager.system-default = {
    imports =
      with inputs.self.modules.homeManager;
      [
        system-minimal
        baseware 
        headful
      ]
      ++ [ inputs.self.modules.generic.systemConstants ];
  };
}
