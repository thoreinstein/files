{
  description = "janders' nix systems";


  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    neovim.url = "github:nix-community/neovim-nightly-overlay";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, darwin, neovim, home-manager, flake-utils }:
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
                home-manager.users.janders = import ./home-manager/default.nix { inherit pkgs; };
              }
            ];
          };
        };

        devShells.default = import ./shell.nix { inherit pkgs; };
      });
}
