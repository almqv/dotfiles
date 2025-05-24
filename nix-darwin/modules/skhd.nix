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
      # Modifier
      super = cmd
      shift = shift
      ctrl = ctrl
      hyper = cmd + alt + ctrl

      # Window Management
      super + return : open -a Alacritty
      super + d : open -a "Rofi"
      super + w : open -a "Rofi -show window"
      super + r : open -a "Rofi -show run"
      super + e : open -a Firefox
      super + b : yabai -m space --toggle bar

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

      # Rotate tree
      super + r : yabai -m space --rotate 90

      # Toggle window float
      super + shift + space : yabai -m window --toggle float

      # Toggle window fullscreen
      super + shift + f : yabai -m window --toggle zoom-fullscreen

      # Toggle window native fullscreen
      super + f : yabai -m window --toggle native-fullscreen

      # Toggle window split
      super + e : yabai -m window --toggle split

      # Balance tree
      super + b : yabai -m space --balance

      # Focus monitor
      super + 1 : yabai -m display --focus 1
      super + 2 : yabai -m display --focus 2
      super + 3 : yabai -m display --focus 3

      # Send window to monitor
      super + shift + 1 : yabai -m window --display 1
      super + shift + 2 : yabai -m window --display 2
      super + shift + 3 : yabai -m window --display 3

      # Focus space
      super + 1 : yabai -m space --focus 1
      super + 2 : yabai -m space --focus 2
      super + 3 : yabai -m space --focus 3
      super + 4 : yabai -m space --focus 4
      super + 5 : yabai -m space --focus 5
      super + 6 : yabai -m space --focus 6
      super + 7 : yabai -m space --focus 7
      super + 8 : yabai -m space --focus 8
      super + 9 : yabai -m space --focus 9

      # Send window to space
      super + shift + 1 : yabai -m window --space 1
      super + shift + 2 : yabai -m window --space 2
      super + shift + 3 : yabai -m window --space 3
      super + shift + 4 : yabai -m window --space 4
      super + shift + 5 : yabai -m window --space 5
      super + shift + 6 : yabai -m window --space 6
      super + shift + 7 : yabai -m window --space 7
      super + shift + 8 : yabai -m window --space 8
      super + shift + 9 : yabai -m window --space 9
    '';
  };
}
