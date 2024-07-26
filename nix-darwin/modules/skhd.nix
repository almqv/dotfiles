{ config, pkgs, ... }:

let 
  termPath = "/Applications/Alacritty.app";
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
      cmd - p : open -n /Applications/choose-gui.app

      # Close window
      cmd + shift - c : yabai -m window --close

      # Focus window
      cmd - j : yabai -m window --focus south
      cmd - k : yabai -m window --focus north
      cmd - h : yabai -m window --focus west
      cmd - l : yabai -m window --focus east

      # Move window
      shift + cmd - j : yabai -m window --swap south
      shift + cmd - k : yabai -m window --swap north
      shift + cmd - h : yabai -m window --swap west
      shift + cmd - l : yabai -m window --swap east

      # Resize window
      shift + alt - h : yabai -m window --resize left:-50:0 ; yabai -m window --resize right:-50:0
      shift + alt - j : yabai -m window --resize bottom:0:50 ; yabai -m window --resize top:0:50
      shift + alt - k : yabai -m window --resize top:0:-50 ; yabai -m window --resize bottom:0:-50
      shift + alt - l : yabai -m window --resize right:50:0 ; yabai -m window --resize left:50:0

      # Toggle floating
      shift + alt - space : yabai -m window --toggle float

      # Make window fullscreen
      alt - f : yabai -m window --toggle zoom-fullscreen

      # Toggle between layouts
      alt - space : yabai -m space --layout $(yabai -m query --spaces --space | jq -r 'if .type == "bsp" then "float" else "bsp" end')

      # Focus workspace
      cmd - 1 : yabai -m space --focus 1
      cmd - 2 : yabai -m space --focus 2
      cmd - 3 : yabai -m space --focus 3
      cmd - 4 : yabai -m space --focus 4
      cmd - 5 : yabai -m space --focus 5
      cmd - 6 : yabai -m space --focus 6
      cmd - 7 : yabai -m space --focus 7
      cmd - 8 : yabai -m space --focus 8
      cmd - 9 : yabai -m space --focus 9

      # Move window to workspace
      shift + cmd - 1 : yabai -m window --space 1
      shift + cmd - 2 : yabai -m window --space 2
      shift + cmd - 3 : yabai -m window --space 3
      shift + cmd - 4 : yabai -m window --space 4
      shift + cmd - 5 : yabai -m window --space 5
      shift + cmd - 6 : yabai -m window --space 6
      shift + cmd - 7 : yabai -m window --space 7
      shift + cmd - 8 : yabai -m window --space 8
      shift + cmd - 9 : yabai -m window --space 9

      # Restart yabai
      shift + cmd - q : yabai --restart-service

      # Start browser
      cmd - b : open -n ${browserPath}

      # Screenshot selection
      cmd - f3 : screencapture -i -c
    '';
  };
}
