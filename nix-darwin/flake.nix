{
  description = "Epsilons darwin configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs: {
    darwinConfigurations = {
      "exa" = inputs.darwin.lib.darwinSystem {
        system = "aarch64-darwin";  # or "x86_64-darwin" for Intel Macs
        modules = [
          ./configuration.nix
          # This module integrates Home Manager:
          inputs.home-manager.darwinModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.elal = import ./home.nix;
          }
        ];
      };
    };
  };
}

