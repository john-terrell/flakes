{
    description = "A flake for building OSGEarth using an OSG overlay that builds with GLCORE";
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    };

    outputs = { nixpkgs, ... }:
        let
            pkgs = nixpkgs.legacyPackages;

            osgearth = {
                pname = "osgearth";
                version = "3.8.1";
                src = pkgs.fetchFromGitHub {
                    owner = "pelicanmapping";
                    repo = "osgearth";
                    rev = "osgearth-3.8.1";
                    sha256 = "somehash";
                };
            };
        in {
            "packages.${pkgs.system}" = {
                default = nixpkgs.stdenv.mkDerivation {
                    pname = "osgearth";
                    version = "3.8.1";
                    src = pkgs.fetchFromGitHub {
                        owner = "pelicanapping";
                        repo = "osgearth";
                        rev = "osgearth-3.8.1";
                        sha256 = "1233";
                    };
                };
            };
        };
}
