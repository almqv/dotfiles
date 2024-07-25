{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager }:
    let
      system = "x86_64-darwin";
    in
    {
      homeConfigurations = {
        username = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { inherit system; };
          modules = [
            home-manager.homeManagerConfiguration {
              home.stateVersion = "23.05";
              imports = [
                ./home.nix
              ];
            }
          ];
        };
      };
    };
}
