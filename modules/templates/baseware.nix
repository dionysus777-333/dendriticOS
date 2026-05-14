{ inputs, ... }:
{
  flake.modules.nixos.baseware = { pkgs, ... }: {
    imports = with inputs.self.modules.nixos; [
      flatpak
    ];
    environment.systemPackages = with pkgs; [
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
      ungoogled-chromium
      qbittorrent-enhanced
      persepolis
      libreoffice
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
  flake.modules.homeManager.baseware = {
    imports = with inputs.self.modules.homeManager; [
      demacsu
      keepassxc 
      nixvim
      librewolf
      syncthing
    ];
  };
}

