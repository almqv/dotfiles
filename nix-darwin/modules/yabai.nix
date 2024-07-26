{ config, pkgs, ... }:

{
  # Create configuration files for yabai and skhd
  home.file.".yabairc" = {
    executable = true;
    text = ''
      #!/usr/bin/env sh

      # load scripting addition
      sudo yabai --load-sa
      yabai -m signal --add event=dock_did_restart action="sudo yabai --load-sa"

      # global settings
      yabai -m config layout                      bsp
      yabai -m config window_placement            second_child
      yabai -m config split_ratio                 0.50
      yabai -m config auto_balance                on

      # Add more yabai configuration here
    '';
  };
}
