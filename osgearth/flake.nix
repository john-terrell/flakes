{
    description = "A flake for building OSGEarth using an OSG overlay that builds with GLCORE";
    inputs = {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
      flake-utils.url = "github:numtide/flake-utils";
    };

    outputs = { self, nixpkgs, flake-utils }:
      flake-utils.lib.eachDefaultSystem (system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
          {
            packages.default = pkgs.stdenv.mkDerivation {
              pname = "osgearth";
              version = "3.8.1";

              src = pkgs.fetchFromGitHub {
                owner = "pelicanmapping";
                repo = "osgearth";
                rev = "osgearth-3.8.1";
                sha256 = "b543hdLllWvqUevsPL3c/2BSP53zS9ZXYm/BWLap+nU=";
              };

              cmakeFlags = [
                "-DCMAKE_BUILD_TYPE=Release"
              ];

              nativeBuildInputs = with pkgs; [
                cmake
              ];

              buildInputs = with pkgs; [
                curl
                gdal
                geos
                openscenegraph
                libzip
                sqlite
              ];
            };
          }
      );
}
