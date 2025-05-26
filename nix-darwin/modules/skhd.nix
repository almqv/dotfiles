{ config, pkgs, lib, ... }:

let 
  termPath = "/Applications/Ghostty.app";
  browserPath = "/Applications/LibreWolf.app";
in
{
  # Add skhd to system packages
  environment.systemPackages = with pkgs; [
    skhd
  ];

  # Configure skhd service at system level
  services.skhd = {
    enable = true;
    skhdConfig = ''
      # Applications
      cmd - return : open -na ${termPath}
      # cmd - b : open -na ${browserPath}

      # Focus windows
      cmd - j : yabai -m window --focus south
      cmd - k : yabai -m window --focus north
      cmd - h : yabai -m window --focus west
      cmd - l : yabai -m window --focus east

      # Move windows
      cmd + shift - j : yabai -m window --swap south
      cmd + shift - k : yabai -m window --swap north
      cmd + shift - h : yabai -m window --swap west
      cmd + shift - l : yabai -m window --swap east

      # Resize windows
      cmd + ctrl - j : yabai -m window --resize bottom:0:20
      cmd + ctrl - k : yabai -m window --resize top:0:20
      cmd + ctrl - h : yabai -m window --resize left:20:0
      cmd + ctrl - l : yabai -m window --resize right:20:0

      # Window States
      cmd + shift - space : yabai -m window --toggle float
      cmd + shift - f : yabai -m window --toggle zoom-fullscreen
      cmd - f : yabai -m window --toggle native-fullscreen
      cmd - e : yabai -m window --toggle split

      # Space Management
      # cmd - r : yabai -m space --rotate 90
      # cmd - b : yabai -m space --balance

      # Screen Navigation
      # cmd - . : yabai -m display --focus east
      # cmd - , : yabai -m display --focus west

      # Move window to screen
      # cmd + shift - . : yabai -m window --display east; yabai -m display --focus east
      # cmd + shift - , : yabai -m window --display west; yabai -m display --focus west

      # Workspace Navigation
      # cmd - 1 : yabai -m space --focus 1
      # cmd - 2 : yabai -m space --focus 2
      # cmd - 3 : yabai -m space --focus 3
      # cmd - 4 : yabai -m space --focus 4
      # cmd - 5 : yabai -m space --focus 5
      # cmd - 6 : yabai -m space --focus 6
      # cmd - 7 : yabai -m space --focus 7
      # cmd - 8 : yabai -m space --focus 8
      # cmd - 9 : yabai -m space --focus 9

      # Send window to workspace
      # cmd + shift - 1 : yabai -m window --space 1
      # cmd + shift - 2 : yabai -m window --space 2
      # cmd + shift - 3 : yabai -m window --space 3
      # cmd + shift - 4 : yabai -m window --space 4
      # cmd + shift - 5 : yabai -m window --space 5
      # cmd + shift - 6 : yabai -m window --space 6
      # cmd + shift - 7 : yabai -m window --space 7
      # cmd + shift - 8 : yabai -m window --space 8
      # cmd + shift - 9 : yabai -m window --space 9
    '';
  };
}
