#!/usr/bin/env bash

sudo launchctl bootout system /Library/LaunchDaemons/org.nixos.nix-daemon.plist 2>/dev/null
sudo launchctl bootstrap system /Library/LaunchDaemons/org.nixos.nix-daemon.plist
sudo launchctl kickstart -k system/org.nixos.nix-daemon

sudo nix run nix-darwin/master#darwin-rebuild -- switch --flake .#exa
