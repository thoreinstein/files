{
  description = "A flake for building Hello World";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixpkgs-unstable;

  outputs = { self, nixpkgs }: {

    defaultPackage.x86_64-darwin =
      # Notice the reference to nixpkgs here.
      with import nixpkgs { system = "x86_64-darwin"; };
      stdenv.mkDerivation {
        name = "dotfiles";
        src = self;
        installPhase = ''
        ${pkgs.stow}/bin/stow bin
        ${pkgs.stow}/bin/stow config
        ${pkgs.stow}/bin/stow direnv
        ${pkgs.stow}/bin/stow git
        ${pkgs.stow}/bin/stow gnupg
        ${pkgs.stow}/bin/stow nvim
        ${pkgs.stow}/bin/stow tmux
        ${pkgs.stow}/bin/stow zsh
        '';
      };

  };
}
