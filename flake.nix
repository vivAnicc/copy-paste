{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    utils = {
      url = "github:vivAnicc/nix-utils";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, utils, ... }: utils.lib.mkFlake (system:
    let
      pkgs = import nixpkgs {inherit system;};
    in {
      packages.${system} = {
        default = pkgs.stdenvNoCC.mkDerivation {
          name = "copy-paste";
          version = "1.0";

          src = ./.;

          buildInputs = [
            pkgs.fish
            pkgs.coreutils
          ];

          dontUnpack = true;

          installPhase = ''
            mkdir -p $out/bin
            cp $src/copy.fish $out/bin/copy
            cp $src/paste.fish $out/bin/paste
          '';
        };
      };
    }
  );
}
