{
  config,
  pkgs,
  lib,
  ...
}:

let
  termPath = "/Applications/Ghostty.app";
  browserPath = "/Applications/LibreWolf.app"; # unused, keep if you’ll bind it later
  delta = 20;
  toStr = builtins.toString;
in
{
  programs.aerospace = {
    enable = true;
    package = pkgs.aerospace;

    userSettings = {
      start-at-login = true;
      after-startup-command = [ ];

      enable-normalization-flatten-containers = true;
      enable-normalization-opposite-orientation-for-nested-containers = true;

      accordion-padding = delta;
      default-root-container-layout = "tiles";
      default-root-container-orientation = "auto";

      on-focused-monitor-changed = [ "move-mouse monitor-lazy-center" ];
      automatically-unhide-macos-hidden-apps = false;

      "key-mapping".preset = "qwerty";

      gaps = {
        inner = {
          horizontal = 0;
          vertical = 0;
        };
        outer = {
          left = 0;
          bottom = 0;
          top = 0;
          right = 0;
        };
      };

      mode = {
        main.binding = {
          # Layout / focus
          "cmd-slash" = "layout tiles horizontal vertical";
          "cmd-h" = "focus left";
          "cmd-j" = "focus down";
          "cmd-k" = "focus up";
          "cmd-l" = "focus right";

          # Move (replaces broken `swap`)
          "cmd-shift-h" = "move left";
          "cmd-shift-j" = "move down";
          "cmd-shift-k" = "move up";
          "cmd-shift-l" = "move right";

          # Resize
          "cmd-shift-minus" = "resize smart -${toStr delta}";
          "cmd-shift-equal" = "resize smart +${toStr delta}";
          "cmd-ctrl-j" = "resize height +${toStr delta}";
          "cmd-ctrl-k" = "resize height -${toStr delta}";
          "cmd-ctrl-h" = "resize width  -${toStr delta}";
          "cmd-ctrl-l" = "resize width  +${toStr delta}";

          # Workspaces 1–9
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

          # Launch + state
          "cmd-return" = "exec-and-forget open -na ${termPath}";
          "cmd-shift-space" = "layout floating tiling";
          "cmd-shift-f" = "fullscreen";
          "cmd-f" = "macos-native-fullscreen";

          # Replace `split opposite` with join-with (works with normalization)
          "cmd-e" = "join-with right";
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
