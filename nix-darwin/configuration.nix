{ pkgs, ... }:

{
  # System-wide configuration
  environment.systemPackages = with pkgs; [
    # Add any system-wide packages here
  ];

  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  system.defaults.dock.autohide = true;
  system.defaults.finder.AppleShowAllExtensions = true;

  # Add more system configurations as needed
}
