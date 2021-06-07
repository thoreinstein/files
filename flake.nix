{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, darwin }: {
    darwinConfigurations."OF060VV4A8HTD6Q" = darwin.lib.darwinSystem {
      modules = [ .nixpkgs/darwin-configuration.nix ];
    };
  };
}
