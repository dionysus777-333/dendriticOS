{
  flake.modules.homeManager.filetree = {
    xdg.userDirs = {
      enable = true;
      createDirectories = true; # This is the magic "if it doesn't exist" flag
      documents = "$HOME/Documents";
      download = "$HOME/Downloads";
      music = "$HOME/Music";
      screenshots = "$HOME/Pictures/Screenshots";
      videos = "$HOME/Videos";
      desktop = "$HOME/Desktop"; # You can disable folders you don't want
    };
  };
}
