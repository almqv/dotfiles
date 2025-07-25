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
      # Ensure we start at login; HM only writes the file, so you still need a launchd agent or the built‑in login item
      start-at-login = true;

      # Run once so every fresh workspace starts horizontal (master left / stack right)
      after-startup-command = [
        "layout tiles horizontal vertical"
      ];

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
          "alt-slash" = "layout tiles horizontal vertical";
          "alt-h" = "focus left";
          "alt-j" = "focus down";
          "alt-k" = "focus up";
          "alt-l" = "focus right";

          # Move (using move since your build errors on swap)
          "alt-shift-h" = "move left";
          "alt-shift-j" = "move down";
          "alt-shift-k" = "move up";
          "alt-shift-l" = "move right";

          # Resize
          "alt-shift-minus" = "resize smart -${toStr delta}";
          "alt-shift-equal" = "resize smart +${toStr delta}";
          "alt-ctrl-j" = "resize height +${toStr delta}";
          "alt-ctrl-k" = "resize height -${toStr delta}";
          "alt-ctrl-h" = "resize width  -${toStr delta}";
          "alt-ctrl-l" = "resize width  +${toStr delta}";

          # Workspaces 1–10
          "alt-1" = "workspace 1";
          "alt-2" = "workspace 2";
          "alt-3" = "workspace 3";
          "alt-4" = "workspace 4";
          "alt-5" = "workspace 5";
          "alt-6" = "workspace 6";
          "alt-7" = "workspace 7";
          "alt-8" = "workspace 8";
          "alt-9" = "workspace 9";
          "alt-0" = "workspace 10";

          "alt-shift-1" = "move-node-to-workspace 1";
          "alt-shift-2" = "move-node-to-workspace 2";
          "alt-shift-3" = "move-node-to-workspace 3";
          "alt-shift-4" = "move-node-to-workspace 4";
          "alt-shift-5" = "move-node-to-workspace 5";
          "alt-shift-6" = "move-node-to-workspace 6";
          "alt-shift-7" = "move-node-to-workspace 7";
          "alt-shift-8" = "move-node-to-workspace 8";
          "alt-shift-9" = "move-node-to-workspace 9";
          "alt-shift-0" = "move-node-to-workspace 10";

          # Launch + state
          "alt-enter" = "exec-and-forget open -na ${termPath}";
          "alt-shift-space" = "layout floating tiling";
          "alt-shift-f" = "fullscreen";
          "alt-f" = "macos-native-fullscreen";

          # Replace `split opposite` with join-with (works with normalization)
          # This merges current node with the container to the right, preserving the right-side stack.
          "alt-e" = "join-with right";
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
  home.activation.reloadAeroSpace = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    PGREP=/usr/bin/pgrep
    OPEN=/usr/bin/open
    KILLALL=/usr/bin/killall
    AS=${pkgs.aerospace}/bin/aerospace
    APP="${pkgs.aerospace}/Applications/AeroSpace.app/Contents/MacOS/AeroSpace"

    if $PGREP -x AeroSpace >/dev/null 2>&1; then
      echo Reloading AeroSpace config...
      $AS reload-config --no-gui || $KILLALL AeroSpace
    else
      echo Loading AeroSpace...
      $OPEN -a AeroSpace || "$APP" &
    fi
  '';

}
