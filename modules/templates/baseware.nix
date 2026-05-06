{ inputs, ... }:
{
  flake.modules.nixos.baseware = {
    modules = with inputs.self.modules.nixos; [
      librewolf
      nixvim
      demacsu
      keepassxc
      flatpak
    ];
    environment.systemPackages = with inputs.pkgs; [
      alsa-utils
      keyutils
      qimgv
      evtest
      lact
      yazi
      kdePackages.dolphin
      kdePackages.kleopatra
      zathura
      zotero
      localsend
      qdirstat
      piper
      libratbag
    ];
    services.flatpak.packages = [
      "com.github.vikdevelop.photopea_app"
    ];
    services.ratbagd.enable = true;
    services.mullvad-vpn.enable = true;
    xdg.mime.defaultApplications = {
      "application/pdf" = "org.pwmt.zathura.desktop";
    };
  };
}

