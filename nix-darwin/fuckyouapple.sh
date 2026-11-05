#!/usr/bin/env bash
set -euo pipefail

NIX=/nix/var/nix/profiles/default/bin/nix

sudo launchctl bootout system /Library/LaunchDaemons/org.nixos.nix-daemon.plist 2>/dev/null || true
sudo launchctl bootstrap system /Library/LaunchDaemons/org.nixos.nix-daemon.plist
sudo launchctl kickstart -k system/org.nixos.nix-daemon

sudo -H env \
  NIX_SSL_CERT_FILE=/etc/ssl/cert.pem \
  NIX_REMOTE=local \
  "$NIX" --extra-experimental-features 'nix-command flakes' \
  run github:nix-darwin/nix-darwin/master#darwin-rebuild -- switch --flake .#exa
