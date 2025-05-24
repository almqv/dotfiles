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
      # Modifiers
      super = cmd
      shift = shift
      ctrl = ctrl
      alt = alt

      # Applications
      super + return : open -a ${termPath}
      super + b : open -a ${browserPath}

      # Focus windows
      super + j : yabai -m window --focus south
      super + k : yabai -m window --focus north
      super + h : yabai -m window --focus west
      super + l : yabai -m window --focus east

      # Move windows
      super + shift + j : yabai -m window --swap south
      super + shift + k : yabai -m window --swap north
      super + shift + h : yabai -m window --swap west
      super + shift + l : yabai -m window --swap east

      # Resize windows
      super + ctrl + j : yabai -m window --resize bottom:0:20
      super + ctrl + k : yabai -m window --resize top:0:20
      super + ctrl + h : yabai -m window --resize left:20:0
      super + ctrl + l : yabai -m window --resize right:20:0

      # Window States
      super + shift + space : yabai -m window --toggle float
      super + shift + f : yabai -m window --toggle zoom-fullscreen
      super + f : yabai -m window --toggle native-fullscreen
      super + e : yabai -m window --toggle split

      # Space Management
      super + r : yabai -m space --rotate 90
      # super + b : yabai -m space --balance

      # Monitor Management
      super + alt + 1 : yabai -m display --focus 1
      super + alt + 2 : yabai -m display --focus 2
      super + alt + 3 : yabai -m display --focus 3

      # Send window to monitor
      super + alt + shift + 1 : yabai -m window --display 1
      super + alt + shift + 2 : yabai -m window --display 2
      super + alt + shift + 3 : yabai -m window --display 3

      # Space Navigation
      super + alt + 1 : yabai -m space --focus 1
      super + alt + 2 : yabai -m space --focus 2
      super + alt + 3 : yabai -m space --focus 3
      super + alt + 4 : yabai -m space --focus 4
      super + alt + 5 : yabai -m space --focus 5
      super + alt + 6 : yabai -m space --focus 6
      super + alt + 7 : yabai -m space --focus 7
      super + alt + 8 : yabai -m space --focus 8
      super + alt + 9 : yabai -m space --focus 9

      # Send window to space
      super + alt + shift + 1 : yabai -m window --space 1
      super + alt + shift + 2 : yabai -m window --space 2
      super + alt + shift + 3 : yabai -m window --space 3
      super + alt + shift + 4 : yabai -m window --space 4
      super + alt + shift + 5 : yabai -m window --space 5
      super + alt + shift + 6 : yabai -m window --space 6
      super + alt + shift + 7 : yabai -m window --space 7
      super + alt + shift + 8 : yabai -m window --space 8
      super + alt + shift + 9 : yabai -m window --space 9
    '';
  };
}
