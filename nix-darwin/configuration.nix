{ pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    git
  ];

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Enable zsh
  programs.zsh.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # Fix dumb MacOS features that no one asked for
  system.defaults.NSGlobalDomain = {
    ApplePressAndHoldEnabled = false;
  };

  # Allow unfree (and optionally broken) packages
  nixpkgs.config = {
    allowUnfree = true;
    # If needed, you can also allow broken packages:
    # allowBroken = true;
  };

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  users.users.elal = {
    name = "elal";
    home = "/Users/elal";
  };

  # Import window management modules
  imports = [
    # ./modules/yabai.nix
    # ./modules/skhd.nix
  ];
}
