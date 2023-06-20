{
  inputs = {
    flake-utilities.url = "github:numtide/flake-utils";
    nix-packages.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs = {
    flake-utilities,
    nix-packages,
    ...
  }:
    flake-utilities.lib.eachDefaultSystem (system: let
      packages = import nix-packages {
        inherit system;
      };
    in {
      devShells.default = packages.mkShell {
        buildInputs = with packages; [
          nodejs
        ];
      };
    });
}
