{
  config,
  pkgs,
  lib,
  ...
}:

let
  termPath = "/Applications/Ghostty.app";
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

      accordion-padding = 30;
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
        main = {
          binding = {
            # Defaults (trimmed to workspaces 1–9)
            "alt-slash" = "layout tiles horizontal vertical";
            "alt-comma" = "layout accordion horizontal vertical";

            "alt-h" = "focus left";
            "alt-j" = "focus down";
            "alt-k" = "focus up";
            "alt-l" = "focus right";

            "alt-shift-h" = "move left";
            "alt-shift-j" = "move down";
            "alt-shift-k" = "move up";
            "alt-shift-l" = "move right";

            "alt-minus" = "resize smart -50";
            "alt-equal" = "resize smart +50";

            "alt-1" = "workspace 1";
            "alt-2" = "workspace 2";
            "alt-3" = "workspace 3";
            "alt-4" = "workspace 4";
            "alt-5" = "workspace 5";
            "alt-6" = "workspace 6";
            "alt-7" = "workspace 7";
            "alt-8" = "workspace 8";
            "alt-9" = "workspace 9";

            "alt-shift-1" = "move-node-to-workspace 1";
            "alt-shift-2" = "move-node-to-workspace 2";
            "alt-shift-3" = "move-node-to-workspace 3";
            "alt-shift-4" = "move-node-to-workspace 4";
            "alt-shift-5" = "move-node-to-workspace 5";
            "alt-shift-6" = "move-node-to-workspace 6";
            "alt-shift-7" = "move-node-to-workspace 7";
            "alt-shift-8" = "move-node-to-workspace 8";
            "alt-shift-9" = "move-node-to-workspace 9";

            "alt-tab" = "workspace-back-and-forth";
            "alt-shift-tab" = "move-workspace-to-monitor --wrap-around next";
            "alt-shift-semicolon" = "mode service";

            # Your old skhd cmd-* bindings
            "cmd-return" = "exec-and-forget open -na ${termPath}";
            "cmd-j" = "focus down";
            "cmd-k" = "focus up";
            "cmd-h" = "focus left";
            "cmd-l" = "focus right";

            "cmd-shift-j" = "swap down";
            "cmd-shift-k" = "swap up";
            "cmd-shift-h" = "swap left";
            "cmd-shift-l" = "swap right";

            "cmd-ctrl-j" = "resize height +20";
            "cmd-ctrl-k" = "resize height -20";
            "cmd-ctrl-h" = "resize width  -20";
            "cmd-ctrl-l" = "resize width  +20";

            "cmd-shift-space" = "layout floating tiling";
            "cmd-shift-f" = "fullscreen";
            "cmd-f" = "macos-native-fullscreen";
            "cmd-e" = "split opposite";
          };
        };

        service = {
          binding = {
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
  };
}
