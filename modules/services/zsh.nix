{
  flake.modules.homeManager.zsh = { pkgs, ... }: {
    programs.zsh = {
      enable = true;

      oh-my-zsh = {
        enable = true;
        plugins = [ "fzf" "git" ];
      };

      plugins = [
        {
          name = "you-should-use";
          src = pkgs.zsh-you-should-use;
          file = "share/zsh/plugins/you-should-use/you-should-use.plugin.zsh";
        }
      ];
      
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        # Nix specific
        nx = "nix-shell";
        nd = "nix develop";
        nfu = "nix flake update";
        # Clean up
        nclean = "sudo nix-collect-garbage -d && nix-store --optimize";
        # Navigation
        ".."    = "cd ..";
        "..."   = "cd ../..";
        "...."  = "cd ../../..";
        # Better Defaults
        ls      = "ls --color=auto";
        ll      = "ls -lh";
        la      = "ls -a";
        lla     = "ls -lah";
        grep    = "grep --color=auto";
        # General System
        restart = "sudo reboot now";
        # Git (because who wants to type 'git'?)
        g = "git";
        gs = "git status";
        ga = "git add";
        gc = "git commit -m";
        gp = "git push";
        # System & Network
        df      = "df -h";
        free    = "free -m";
        myip    = "curl -s https://ifconfig.me";
        ports   = "sudo ss -tulanp";
        # Helpers
        untar   = "tar -zxvf";
        up      = "nix-channel --update && nix-env -u";
      };
    };
    home.packages = with pkgs; [
      eza        # better ls
      fd         # better find
      ripgrep    # fast grep
      bat
      fzf
   ];
  };
}
