{
  description = "A very basic flake";

    inputs = {
    nixpkgs = { url = "https://github.com/NixOS/nixpkgs/archive/e521a883757b06720d28d4a303e0b4f7f0d7fcfc.tar.gz"; };
    flake-utils = { url = "github:numtide/flake-utils"; };
  };

  outputs = { self, nixpkgs, flake-utils  }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        inherit (nixpkgs.lib) optional;
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = [
            pkgs.ghc
            pkgs.cabal-install
            pkgs.stack
            pkgs.haskell-language-server
            pkgs.nil
            pkgs.nixpkgs-fmt
            pkgs.dprint
          ];
        };
      });
}
