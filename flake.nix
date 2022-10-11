{
  description = "janders' nix systems";


  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    dotfiles.url = "github:janders223/files";
    neovim.url = "github:nix-community/neovim-nightly-overlay";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, darwin, dotfiles, neovim, home-manager, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        nixpkgsConfig = {
          overlays = [
            neovim.overlay
          ];
        };
      in
      {
        legacyPackages.darwinConfigurations = {
          mac-0002 = darwin.lib.darwinSystem {
            system = "x86_64-darwin";
            modules = [
              ./hosts/mac-0002/default.nix
              home-manager.darwinModules.home-manager
              {
                nixpkgs = nixpkgsConfig;
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
              }
            ];
          };
        };

        devShells.default = import ./shell.nix { inherit pkgs; };
      });
}