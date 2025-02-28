{
  lib,
  fetchFromGitHub,
  stdenvNoCC,
}:
stdenvNoCC.mkDerivation {
  pname = "dina-font";
  version = "0-unstable-2020-12-20";

  src = fetchFromGitHub {
    owner = "zshoals";
    repo = "Dina-Font-TTF-Remastered";
    rev = "82b0167371dcac934d89f2f3cba80eab00648ad2";
    hash = "sha256-TwK1Mh5+8arSQ6K9OFtJfigRae3ovYpNZJgmW6yjt0c=";
  };

  installPhase = ''
    runHook preInstall

    install -Dm644 --target $out/share/fonts/truetype $src/Fonts/*.ttc

    runHook postInstall
  '';

  meta = {
    description = "Monospaced font designed specifically for screenplays";
    homepage = "https://github.com/zshoals/Dina-Font-TTF-Remastered";
    platforms = lib.platforms.all;
    # maintainers = [ lib.maintainers.heisfer ];
    # license = lib.licenses.free? mit? dunnno
  };
}
