{
  flake-file.inputs = {
    nix-doom-emacs-unstraightened.url = "github:marienz/nix-doom-emacs-unstraightened";
  };
  flake.home-manager.users.user = {
    programs.doom-emacs = {
      enable = true;
      doomDir = ./doom.d;
      extraPackages = epkgs: [ 
        epkgs.org-roam 
        epkgs.org-roam-ui
        epkgs.org-roam-timestamps
        epkgs.org-roam-bibtex
        epkgs.vertigo
        epkgs.consult
        epkgs.orderless
        epkgs.marginalia
        epkgs.org-modern
        epkgs.org-appear
        epkgs.magit
        epkgs.pdf-tools
        epkgs.org-noter
      ];
    };
  };
}
