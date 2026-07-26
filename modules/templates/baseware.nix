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
      cifs-utils
      samba
      kdePackages.kio
      kdePackages.kio-extras
      kdePackages.kio-fuse
      kdePackages.kwallet
      kdePackages.dolphin
      kdePackages.kleopatra
      kdePackages.okular
      zotero
      localsend
      qdirstat
      piper
      libratbag
      ungoogled-chromium
      qbittorrent-enhanced
      persepolis
      vlc
      libreoffice
      moonlight-qt
      distrobox
    ];
    services.flatpak.packages = [
      "com.github.vikdevelop.photopea_app"
      "it.mijorus.gearlever"
    ];
    programs.appimage = {
      enable = true;
      binfmt = true; # Allows you to run AppImages directly with ./file.AppImage
    };
    virtualisation.podman = {
      enable = true;
      dockerCompat = true;  # Creates a 'docker' alias for podman compatibility
      defaultNetwork.settings.dns_enabled = true;
    };
    services.ratbagd.enable = true;
    services.mullvad-vpn = {
      enable = true; 
      package = pkgs.mullvad-vpn;
    };
    programs.gnupg.agent.enable = true;
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

