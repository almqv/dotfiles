{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    yabai
    sudo
  ];

  # Create a script to install and load the scripting addition
  home.activation.installYabaiSA = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if ! ${pkgs.sudo}/bin/sudo -n true 2>/dev/null; then
      echo "Please enter your password to install yabai scripting addition:"
      ${pkgs.sudo}/bin/sudo yabai --install-sa
      ${pkgs.sudo}/bin/sudo yabai --load-sa
    else
      ${pkgs.sudo}/bin/sudo yabai --install-sa
      ${pkgs.sudo}/bin/sudo yabai --load-sa
    fi
  '';

  # Create a script to start yabai
  home.activation.startYabai = lib.hm.dag.entryAfter [ "installYabaiSA" ] ''
    if ! pgrep -x "yabai" > /dev/null; then
      yabai --start-service
    fi
  '';

  # Create a script to configure yabai
  home.activation.configureYabai = lib.hm.dag.entryAfter [ "startYabai" ] ''
    # General settings
    yabai -m config window_border off
    yabai -m config window_border_width 0
    yabai -m config window_gap 0
    yabai -m config window_shadow off
    yabai -m config window_opacity off
    yabai -m config window_opacity_duration 0.0
    yabai -m config active_window_opacity 1.0
    yabai -m config normal_window_opacity 0.9
    yabai -m config window_placement second_child
    yabai -m config window_topmost off
    yabai -m config window_zoom_persist off
    yabai -m config window_zoom_fullscreen off
    yabai -m config window_animation_duration 0.0
    yabai -m config window_animation_frame_rate 120

    # Layout settings
    yabai -m config layout bsp
    yabai -m config auto_balance on
    yabai -m config split_ratio 0.50
    yabai -m config mouse_modifier fn
    yabai -m config mouse_action1 move
    yabai -m config mouse_action2 resize
    yabai -m config mouse_drop_action swap

    # Space settings
    yabai -m config top_padding 0
    yabai -m config bottom_padding 0
    yabai -m config left_padding 0
    yabai -m config right_padding 0
    yabai -m config external_bar all:0:0
    yabai -m config external_bar_all_displays off
    yabai -m config external_bar_padding 0
    yabai -m config external_bar_height 0
    yabai -m config external_bar_orientation bottom
    yabai -m config external_bar_always_on_top off
    yabai -m config external_bar_hidden off
    yabai -m config external_bar_autohide off
    yabai -m config external_bar_autohide_delay 0.0
    yabai -m config external_bar_autohide_duration 0.0
    yabai -m config external_bar_autohide_offset 0
    yabai -m config external_bar_autohide_show on
    yabai -m config external_bar_autohide_hide off
    yabai -m config external_bar_autohide_show_delay 0.0
    yabai -m config external_bar_autohide_hide_delay 0.0
    yabai -m config external_bar_autohide_show_duration 0.0
    yabai -m config external_bar_autohide_hide_duration 0.0
    yabai -m config external_bar_autohide_show_offset 0
    yabai -m config external_bar_autohide_hide_offset 0
    yabai -m config external_bar_autohide_show_animation slide
    yabai -m config external_bar_autohide_hide_animation slide
    yabai -m config external_bar_autohide_show_animation_duration 0.0
    yabai -m config external_bar_autohide_hide_animation_duration 0.0
    yabai -m config external_bar_autohide_show_animation_frame_rate 120
    yabai -m config external_bar_autohide_hide_animation_frame_rate 120
    yabai -m config external_bar_autohide_show_animation_curve ease
    yabai -m config external_bar_autohide_hide_animation_curve ease
    yabai -m config external_bar_autohide_show_animation_curve_points "0.0,0.0,0.2,1.0,1.0,1.0"
    yabai -m config external_bar_autohide_hide_animation_curve_points "0.0,0.0,0.2,1.0,1.0,1.0"
    yabai -m config external_bar_autohide_show_animation_curve_tension 0.0
    yabai -m config external_bar_autohide_hide_animation_curve_tension 0.0
    yabai -m config external_bar_autohide_show_animation_curve_bias 0.0
    yabai -m config external_bar_autohide_hide_animation_curve_bias 0.0
    yabai -m config external_bar_autohide_show_animation_curve_continuity 0.0
    yabai -m config external_bar_autohide_hide_animation_curve_continuity 0.0
    yabai -m config external_bar_autohide_show_animation_curve_overshoot 0.0
    yabai -m config external_bar_autohide_hide_animation_curve_overshoot 0.0
    yabai -m config external_bar_autohide_show_animation_curve_overshoot_tension 0.0
    yabai -m config external_bar_autohide_hide_animation_curve_overshoot_tension 0.0
    yabai -m config external_bar_autohide_show_animation_curve_overshoot_bias 0.0
    yabai -m config external_bar_autohide_hide_animation_curve_overshoot_bias 0.0
    yabai -m config external_bar_autohide_show_animation_curve_overshoot_continuity 0.0
    yabai -m config external_bar_autohide_hide_animation_curve_overshoot_continuity 0.0
    yabai -m config external_bar_autohide_show_animation_curve_overshoot_overshoot 0.0
    yabai -m config external_bar_autohide_hide_animation_curve_overshoot_overshoot 0.0
  '';
} 