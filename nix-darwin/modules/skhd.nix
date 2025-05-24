{ config, pkgs, lib, ... }:

let 
  termPath = "/Applications/Ghostty.app";
  browserPath = "/Applications/LibreWolf.app";
in
{
  home.packages = with pkgs; [
    skhd
  ];

  # Enable skhd service
  services.skhd = {
    enable = true;
    config = ''
      # Modifier
      alt = cmd
      shift = shift
      ctrl = ctrl
      hyper = cmd + alt + ctrl

      # Window Management
      alt + return : open -a Alacritty
      alt + d : open -a "Rofi"
      alt + w : open -a "Rofi -show window"
      alt + r : open -a "Rofi -show run"
      alt + e : open -a Firefox
      alt + b : yabai -m space --toggle bar

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

      # Rotate tree
      alt + r : yabai -m space --rotate 90

      # Toggle window float
      alt + shift + space : yabai -m window --toggle float

      # Toggle window fullscreen
      alt + shift + f : yabai -m window --toggle zoom-fullscreen

      # Toggle window native fullscreen
      alt + f : yabai -m window --toggle native-fullscreen

      # Toggle window split
      alt + e : yabai -m window --toggle split

      # Balance tree
      alt + b : yabai -m space --balance

      # Focus monitor
      alt + 1 : yabai -m display --focus 1
      alt + 2 : yabai -m display --focus 2
      alt + 3 : yabai -m display --focus 3

      # Send window to monitor
      alt + shift + 1 : yabai -m window --display 1
      alt + shift + 2 : yabai -m window --display 2
      alt + shift + 3 : yabai -m window --display 3

      # Focus space
      alt + 1 : yabai -m space --focus 1
      alt + 2 : yabai -m space --focus 2
      alt + 3 : yabai -m space --focus 3
      alt + 4 : yabai -m space --focus 4
      alt + 5 : yabai -m space --focus 5
      alt + 6 : yabai -m space --focus 6
      alt + 7 : yabai -m space --focus 7
      alt + 8 : yabai -m space --focus 8
      alt + 9 : yabai -m space --focus 9

      # Send window to space
      alt + shift + 1 : yabai -m window --space 1
      alt + shift + 2 : yabai -m window --space 2
      alt + shift + 3 : yabai -m window --space 3
      alt + shift + 4 : yabai -m window --space 4
      alt + shift + 5 : yabai -m window --space 5
      alt + shift + 6 : yabai -m window --space 6
      alt + shift + 7 : yabai -m window --space 7
      alt + shift + 8 : yabai -m window --space 8
      alt + shift + 9 : yabai -m window --space 9

      # Toggle window split
      alt + t : yabai -m window --toggle split

      # Toggle window float
      alt + shift + space : yabai -m window --toggle float

      # Toggle window fullscreen
      alt + shift + f : yabai -m window --toggle zoom-fullscreen

      # Toggle window native fullscreen
      alt + f : yabai -m window --toggle native-fullscreen

      # Toggle window split
      alt + e : yabai -m window --toggle split

      # Balance tree
      alt + b : yabai -m space --balance

      # Focus monitor
      alt + 1 : yabai -m display --focus 1
      alt + 2 : yabai -m display --focus 2
      alt + 3 : yabai -m display --focus 3

      # Send window to monitor
      alt + shift + 1 : yabai -m window --display 1
      alt + shift + 2 : yabai -m window --display 2
      alt + shift + 3 : yabai -m window --display 3

      # Focus space
      alt + 1 : yabai -m space --focus 1
      alt + 2 : yabai -m space --focus 2
      alt + 3 : yabai -m space --focus 3
      alt + 4 : yabai -m space --focus 4
      alt + 5 : yabai -m space --focus 5
      alt + 6 : yabai -m space --focus 6
      alt + 7 : yabai -m space --focus 7
      alt + 8 : yabai -m space --focus 8
      alt + 9 : yabai -m space --focus 9

      # Send window to space
      alt + shift + 1 : yabai -m window --space 1
      alt + shift + 2 : yabai -m window --space 2
      alt + shift + 3 : yabai -m window --space 3
      alt + shift + 4 : yabai -m window --space 4
      alt + shift + 5 : yabai -m window --space 5
      alt + shift + 6 : yabai -m window --space 6
      alt + shift + 7 : yabai -m window --space 7
      alt + shift + 8 : yabai -m window --space 8
      alt + shift + 9 : yabai -m window --space 9
    '';
  };

  # Create a script to start skhd
  home.activation.startSkhd = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if ! pgrep -x "skhd" > /dev/null; then
      skhd --start-service
    fi
  '';
}
