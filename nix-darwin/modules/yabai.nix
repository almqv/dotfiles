{ config, pkgs, ... }:

let 
  split_ratio = "0.50";
  gap_padding = "16";
in
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
      yabai -m config split_ratio                 ${split_ratio}
      yabai -m config auto_balance                on

      # Set all padding and gaps 
      yabai -m config top_padding    ${gap_padding}
      yabai -m config bottom_padding ${gap_padding}
      yabai -m config left_padding   ${gap_padding}
      yabai -m config right_padding  ${gap_padding}
      yabai -m config window_gap     ${gap_padding}

      # mouse stuff 
      # yabai -m config mouse_follows_focus on
      yabai -m config focus_follows_mouse autofocus

      yabai -m config mouse_modifier cmd
      yabai -m config mouse_action1 move
      yabai -m config mouse_action2 resize
    '';
  };
}
