{ pkgs }:

with pkgs;

mkShell {
  nativeBuildInputs = [
    rnix-lsp
    sumneko-lua-language-server
    nodejs
  ];

  PATH = "$PATH:${rnix-lsp}/bin:${sumneko-lua-language-server}/bin";
}

