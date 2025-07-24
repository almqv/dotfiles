{
  config,
  pkgs,
  lib,
  ...
}:

let
  termPath = "/Applications/Ghostty.app";
  browserPath = "/Applications/LibreWolf.app";
  delta = "20";
in
{
  programs.aerospace = {
    enable = true;
    package = pkgs.aerospace;

    userSettings = {
      after-startup-command = [ ];
      start-at-login = false;

      enable-normalization-flatten-containers = true;
      enable-normalization-opposite-orientation-for-nested-containers = true;

      accordion-padding = delta;
      default-root-container-layout = "tiles";
      default-root-container-orientation = "auto";

      on-focused-monitor-changed = [ "move-mouse monitor-lazy-center" ];
      automatically-unhide-macos-hidden-apps = false;

      key-mapping.preset = "qwerty";

      gaps = {
        inner.horizontal = 0;
        inner.vertical = 0;
        outer.left = 0;
        outer.bottom = 0;
        outer.top = 0;
        outer.right = 0;
      };

      mode = {
        main.binding = {
          # Defaults 
          "cmd-slash" = "layout tiles horizontal vertical";
          # "cmd-comma" = "layout accordion horizontal vertical";

          "cmd-h" = "focus left";
          "cmd-j" = "focus down";
          "cmd-k" = "focus up";
          "cmd-l" = "focus right";

          # drop default 'move' bindings to keep your swap bindings (below)

          "cmd-shift-minus" = "resize smart -${delta}";
          "cmd-shift-equal" = "resize smart +${delta}";

          "cmd-1" = "workspace 1";
          "cmd-2" = "workspace 2";
          "cmd-3" = "workspace 3";
          "cmd-4" = "workspace 4";
          "cmd-5" = "workspace 5";
          "cmd-6" = "workspace 6";
          "cmd-7" = "workspace 7";
          "cmd-8" = "workspace 8";
          "cmd-9" = "workspace 9";

          "cmd-shift-1" = "move-node-to-workspace 1";
          "cmd-shift-2" = "move-node-to-workspace 2";
          "cmd-shift-3" = "move-node-to-workspace 3";
          "cmd-shift-4" = "move-node-to-workspace 4";
          "cmd-shift-5" = "move-node-to-workspace 5";
          "cmd-shift-6" = "move-node-to-workspace 6";
          "cmd-shift-7" = "move-node-to-workspace 7";
          "cmd-shift-8" = "move-node-to-workspace 8";
          "cmd-shift-9" = "move-node-to-workspace 9";

          # "cmd-tab" = "workspace-back-and-forth";
          # "cmd-shift-tab" = "move-workspace-to-monitor --wrap-around next";
          # "cmd-shift-semicolon" = "mode service";

          # Open terminal
          "cmd-return" = "exec-and-forget open -na ${termPath}";

          # swap (instead of default move)
          "cmd-shift-h" = "swap left";
          "cmd-shift-j" = "swap down";
          "cmd-shift-k" = "swap up";
          "cmd-shift-l" = "swap right";

          # fine-grained resize
          "cmd-ctrl-j" = "resize height +${delta}";
          "cmd-ctrl-k" = "resize height -${delta}";
          "cmd-ctrl-h" = "resize width  -${delta}";
          "cmd-ctrl-l" = "resize width  +${delta}";

          # states
          "cmd-shift-space" = "layout floating tiling";
          "cmd-shift-f" = "fullscreen";
          "cmd-f" = "macos-native-fullscreen";
          "cmd-e" = "split opposite";
        };

        service.binding = {
          esc = [
            "reload-config"
            "mode main"
          ];
          r = [
            "flatten-workspace-tree"
            "mode main"
          ];
          f = [
            "layout floating tiling"
            "mode main"
          ];
          backspace = [
            "close-all-windows-but-current"
            "mode main"
          ];

          # Keep service mode on ALT to avoid colliding with main CMD binds.
          "alt-shift-h" = [
            "join-with left"
            "mode main"
          ];
          "alt-shift-j" = [
            "join-with down"
            "mode main"
          ];
          "alt-shift-k" = [
            "join-with up"
            "mode main"
          ];
          "alt-shift-l" = [
            "join-with right"
            "mode main"
          ];

          down = "volume down";
          up = "volume up";
          "shift-down" = [
            "volume set 0"
            "mode main"
          ];
        };
      };
    };
  };
}
