{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    clang
    gcc
    lua
    nixfmt
    rnix-lsp
    tree
    tree-sitter
  ];
}
