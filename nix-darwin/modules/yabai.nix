{ config, pkgs, lib, ... }:

{
  # Add yabai to system packages
  environment.systemPackages = with pkgs; [
    yabai
  ];

  # Create a script to install and load the scripting addition
  system.activationScripts.installYabaiSA = lib.mkForce ''
    if ! /usr/bin/sudo -n true 2>/dev/null; then
      echo "Please enter your password to install yabai scripting addition:"
      /usr/bin/sudo yabai --install-sa
      /usr/bin/sudo yabai --load-sa
    else
      /usr/bin/sudo yabai --install-sa
      /usr/bin/sudo yabai --load-sa
    fi
  '';

  # Configure yabai service
  services.yabai = {
    enable = true;
    config = {
      window_border = "off";
      window_border_width = 0;
      window_gap = 0;
      window_shadow = "off";
      window_opacity = "off";
      window_opacity_duration = 0.0;
      active_window_opacity = 1.0;
      normal_window_opacity = 0.9;
      window_placement = "second_child";
      window_topmost = "off";
      window_zoom_persist = "off";
      window_zoom_fullscreen = "off";
      window_animation_duration = 0.0;
      window_animation_frame_rate = 120;
      layout = "bsp";
      auto_balance = "on";
      split_ratio = 0.50;
      mouse_modifier = "fn";
      mouse_action1 = "move";
      mouse_action2 = "resize";
      mouse_drop_action = "swap";
      top_padding = 0;
      bottom_padding = 0;
      left_padding = 0;
      right_padding = 0;
      external_bar = "all:0:0";
      external_bar_all_displays = "off";
      external_bar_padding = 0;
      external_bar_height = 0;
      external_bar_orientation = "bottom";
      external_bar_always_on_top = "off";
      external_bar_hidden = "off";
      external_bar_autohide = "off";
      external_bar_autohide_delay = 0.0;
      external_bar_autohide_duration = 0.0;
      external_bar_autohide_offset = 0;
      external_bar_autohide_show = "on";
      external_bar_autohide_hide = "off";
      external_bar_autohide_show_delay = 0.0;
      external_bar_autohide_hide_delay = 0.0;
      external_bar_autohide_show_duration = 0.0;
      external_bar_autohide_hide_duration = 0.0;
      external_bar_autohide_show_offset = 0;
      external_bar_autohide_hide_offset = 0;
      external_bar_autohide_show_animation = "slide";
      external_bar_autohide_hide_animation = "slide";
      external_bar_autohide_show_animation_duration = 0.0;
      external_bar_autohide_hide_animation_duration = 0.0;
      external_bar_autohide_show_animation_frame_rate = 120;
      external_bar_autohide_hide_animation_frame_rate = 120;
      external_bar_autohide_show_animation_curve = "ease";
      external_bar_autohide_hide_animation_curve = "ease";
      external_bar_autohide_show_animation_curve_points = "0.0,0.0,0.2,1.0,1.0,1.0";
      external_bar_autohide_hide_animation_curve_points = "0.0,0.0,0.2,1.0,1.0,1.0";
      external_bar_autohide_show_animation_curve_tension = 0.0;
      external_bar_autohide_hide_animation_curve_tension = 0.0;
      external_bar_autohide_show_animation_curve_bias = 0.0;
      external_bar_autohide_hide_animation_curve_bias = 0.0;
      external_bar_autohide_show_animation_curve_continuity = 0.0;
      external_bar_autohide_hide_animation_curve_continuity = 0.0;
      external_bar_autohide_show_animation_curve_overshoot = 0.0;
      external_bar_autohide_hide_animation_curve_overshoot = 0.0;
      external_bar_autohide_show_animation_curve_overshoot_tension = 0.0;
      external_bar_autohide_hide_animation_curve_overshoot_tension = 0.0;
      external_bar_autohide_show_animation_curve_overshoot_bias = 0.0;
      external_bar_autohide_hide_animation_curve_overshoot_bias = 0.0;
      external_bar_autohide_show_animation_curve_overshoot_continuity = 0.0;
      external_bar_autohide_hide_animation_curve_overshoot_continuity = 0.0;
      external_bar_autohide_show_animation_curve_overshoot_overshoot = 0.0;
      external_bar_autohide_hide_animation_curve_overshoot_overshoot = 0.0;
    };
  };
} 