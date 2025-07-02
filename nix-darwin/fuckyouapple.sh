#!/usr/bin/env bash
sudo nix run nix-darwin/master#darwin-rebuild -- switch --flake .#exa
