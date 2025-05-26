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
      alt + t : open -na ${termPath}
      alt + b : open -na ${browserPath}

      # Focus windows
      alt + j : yabai -m window --focus south
      alt + k : yabai -m window --focus north
      alt + h : yabai -m window --focus west
      alt + l : yabai -m window --focus east

      # Move windows
      alt + shift + j : yabai -m window --swap south
      alt + shift + k : yabai -m window --swap north
      alt + shift + h : yabai -m window --swap west
      alt + shift + l : yabai -m window --swap east

      # Resize windows
      alt + ctrl + j : yabai -m window --resize bottom:0:20
      alt + ctrl + k : yabai -m window --resize top:0:20
      alt + ctrl + h : yabai -m window --resize left:20:0
      alt + ctrl + l : yabai -m window --resize right:20:0

      # Window States
      alt + shift + space : yabai -m window --toggle float
      alt + shift + f : yabai -m window --toggle zoom-fullscreen
      alt + f : yabai -m window --toggle native-fullscreen
      alt + e : yabai -m window --toggle split

      # Space Management
      alt + r : yabai -m space --rotate 90
      # alt + b : yabai -m space --balance

      # Monitor Management
      ctrl + alt + 1 : yabai -m display --focus 1
      ctrl + alt + 2 : yabai -m display --focus 2
      ctrl + alt + 3 : yabai -m display --focus 3

      # Send window to monitor
      ctrl + alt + shift + 1 : yabai -m window --display 1
      ctrl + alt + shift + 2 : yabai -m window --display 2
      ctrl + alt + shift + 3 : yabai -m window --display 3

      # Space Navigation
      ctrl + alt + 1 : yabai -m space --focus 1
      ctrl + alt + 2 : yabai -m space --focus 2
      ctrl + alt + 3 : yabai -m space --focus 3
      ctrl + alt + 4 : yabai -m space --focus 4
      ctrl + alt + 5 : yabai -m space --focus 5
      ctrl + alt + 6 : yabai -m space --focus 6
      ctrl + alt + 7 : yabai -m space --focus 7
      ctrl + alt + 8 : yabai -m space --focus 8
      ctrl + alt + 9 : yabai -m space --focus 9

      # Send window to space
      ctrl + alt + shift + 1 : yabai -m window --space 1
      ctrl + alt + shift + 2 : yabai -m window --space 2
      ctrl + alt + shift + 3 : yabai -m window --space 3
      ctrl + alt + shift + 4 : yabai -m window --space 4
      ctrl + alt + shift + 5 : yabai -m window --space 5
      ctrl + alt + shift + 6 : yabai -m window --space 6
      ctrl + alt + shift + 7 : yabai -m window --space 7
      ctrl + alt + shift + 8 : yabai -m window --space 8
      ctrl + alt + shift + 9 : yabai -m window --space 9
    '';
  };
}
