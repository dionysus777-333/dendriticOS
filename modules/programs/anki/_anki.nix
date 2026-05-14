{ inputs, ... }:
{
  flake.modules.homeManager.anki = { pkgs, ... }:
    let
      # 1. Build the custom Japanese addon
      japanese = pkgs.anki-utils.buildAnkiAddon (finalAttrs: {
        pname = "Japanese";
        version = "unstable-2025-08-18";
        src = pkgs.fetchFromGitHub {
          owner = "Ajatt-Tools";
          repo = "Japanese";
          rev = "1c993fdb90c771fd5e154bd4e2b57e12a3ca1991";
          hash = "sha256-oQ38Gmvwp1dSgrUZA9pz4DAxPrbQDrhsGoi+BSNh3fs=";
          fetchSubmodules = true;
        };
        sourceRoot = "${finalAttrs.src.name}/japanese";
        patches = [ ./_ajt-japanese.patch ];
        patchFlags = [ "-p2" ];
      });

      # 2. Define Anki with all desired addons
      ankiWithAddons = pkgs.anki.withAddons [
        pkgs.ankiAddons.review-heatmap
        pkgs.ankiAddons.passfail2
        pkgs.ankiAddons.anki-connect
        pkgs.ankiAddons.ajt-card-management
        japanese
      ];

      # 3. Manually wrap Anki using standard Nixpkgs tools
      ankiWrapped = pkgs.symlinkJoin {
        name = "anki-wrapped";
        paths = [ ankiWithAddons ];
        nativeBuildInputs = [ pkgs.makeBinaryWrapper ];
        postBuild = ''
          wrapProgram $out/bin/anki \
            --prefix PATH : ${pkgs.lib.makeBinPath [ pkgs.mecab ]} \
            --set ANKI_JAPANESE_DIR "$HOME/.local/share/Anki2/"
        '';
      };
    in
    {
      # Add the wrapped version to your home packages [cite: 665]
      home.packages = [
        ankiWrapped
      ];
    };
}
