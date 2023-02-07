{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/5a350a8f31bb7ef0c6e79aea3795a890cf7743d4.tar.gz") { } }:

pkgs.mkShell {
  buildInputs = [
    pkgs.ghc
    pkgs.cabal-install
    pkgs.stack
    pkgs.haskell-language-server
    pkgs.nil
    pkgs.nixpkgs-fmt
    pkgs.dprint
  ];
}
