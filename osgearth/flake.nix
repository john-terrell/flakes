{
    description = "A flake for building OSGEarth using an OSG overlay that builds with GLCORE";
    inputs = {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    };

    outputs = { self, nixpkgs }: {
      packages.aarch64-darwin.default =
        let
          pkgs = import nixpkgs { system = "aarch64-darwin"; };
        in
          pkgs.stdenv.mkDerivation {
            pname = "osgearth";
            version = "3.8.1";
            src = pkgs.fetchFromGitHub {
              owner = "pelicanmapping";
              repo = "osgearth";
              rev = "osgearth-3.8.1";
              sha256 = "b543hdLllWvqUevsPL3c/2BSP53zS9ZXYm/BWLap+nU=";
            };
            nativeBuildInputs = with pkgs; [
              cmake
            ];
            buildInputs = with pkgs; [
              curl
              gdal
              geos
              openscenegraph
            ];
          };
    };
}
