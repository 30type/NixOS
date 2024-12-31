{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "gruvbox-plus";

  src = pkgs.fetchurl {
    url = "https://github.com/SylEleuth/gruvbox-plus-icon-pack/tree/master/Gruvbox-Plus-Dark";
    sha256 = "LnZTC4q9qI9oM5sv17VA5xkIMhVhcns1AAMkGL02poI=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/bin
    cp ./* $out/bin
  '';
}
