{
  flake.modules.nixos.plymouth = { pkgs, lib, ... }: {
    boot.plymouth = {
      enable = true;
      theme = lib.mkForce "bgrt";
      font = "${pkgs.nerd-fonts.jetbrains-mono}/share/fonts/truetype/NerdFonts/JetBrainsMono/JetBrainsMonoNerdFont-Regular.ttf";
    };
    boot.consoleLogLevel = 3;
    boot.initrd.verbose = false;
    boot.kernelParams = [ "quiet" "splash" "udev.log_level=3" "systemd.show_status=auto" ];
    boot.loader.timeout = 0;
    boot.loader.systemd-boot.consoleMode = "max";
  };
}
