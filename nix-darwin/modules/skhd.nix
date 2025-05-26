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
      cmd - r : yabai -m space --rotate 90
      # cmd - b : yabai -m space --balance

      # Screen Navigation
      cmd - . : yabai -m display --focus east
      cmd - , : yabai -m display --focus west

      # Move window to screen
      cmd + shift - . : yabai -m window --display east; yabai -m display --focus east
      cmd + shift - , : yabai -m window --display west; yabai -m display --focus west

      # Monitor Management
      cmd + alt - 1 : yabai -m display --focus 1
      cmd + alt - 2 : yabai -m display --focus 2
      cmd + alt - 3 : yabai -m display --focus 3

      # Send window to monitor
      cmd + alt + shift - 1 : yabai -m window --display 1
      cmd + alt + shift - 2 : yabai -m window --display 2
      cmd + alt + shift - 3 : yabai -m window --display 3

      # Space Navigation
      cmd + alt - 1 : yabai -m space --focus 1
      cmd + alt - 2 : yabai -m space --focus 2
      cmd + alt - 3 : yabai -m space --focus 3
      cmd + alt - 4 : yabai -m space --focus 4
      cmd + alt - 5 : yabai -m space --focus 5
      cmd + alt - 6 : yabai -m space --focus 6
      cmd + alt - 7 : yabai -m space --focus 7
      cmd + alt - 8 : yabai -m space --focus 8
      cmd + alt - 9 : yabai -m space --focus 9

      # Send window to space
      cmd + alt + shift - 1 : yabai -m window --space 1
      cmd + alt + shift - 2 : yabai -m window --space 2
      cmd + alt + shift - 3 : yabai -m window --space 3
      cmd + alt + shift - 4 : yabai -m window --space 4
      cmd + alt + shift - 5 : yabai -m window --space 5
      cmd + alt + shift - 6 : yabai -m window --space 6
      cmd + alt + shift - 7 : yabai -m window --space 7
      cmd + alt + shift - 8 : yabai -m window --space 8
      cmd + alt + shift - 9 : yabai -m window --space 9
    '';
  };
}
