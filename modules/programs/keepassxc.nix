{
  flake.modules.homeManager.keepassxc = {
    programs.keepassxc = {
      enable = true;
      settings = {
        GUI = {
          ApplicationTheme = "dark";
        };
        Security = {
          LockDatabaseIdleSeconds = 30;
        };
      };
    };
  };
}
