{ config, pkgs, ... }:

let 
  termPath = "/Applications/Ghostty.app";
  browserPath = "/Applications/Firefox.app";
in
{
  home.file.".skhdrc" = {
    executable = true;
    text = ''
      # Mod1 is alt, Mod4 is cmd

      # Terminal
      cmd - return : open -n ${termPath}

      # dmenu equivalent (you may want to install choose-gui or another launcher)
      # cmd - p : open -n /Applications/choose-gui.app

      # Start browser
      shift + cmd - b : open -n ${browserPath}

      # Screenshot selection
      cmd - f3 : screencapture -i -c
    '';
  };
}
