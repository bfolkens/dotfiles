{
  lib,
  stdenv,
  fetchurl,
  makeWrapper,
  perl,
  unzip,
}:

stdenv.mkDerivation rec {
  pname = "docx2txt-perl";
  version = "1.4";

  src = fetchurl {
    url = "mirror://sourceforge/docx2txt/docx2txt-${version}.tgz";
    hash = "sha256-spd1KRCkBMFDXnA9Wu20VxIivXWfoxbIatjIu+WMbRs=";
  };

  nativeBuildInputs = [ makeWrapper ];
  buildInputs = [
    perl
    unzip
  ];

  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin $out/libexec

    # Install core script and configuration
    cp docx2txt.pl $out/libexec/docx2txt.pl
    cp docx2txt.config $out/libexec/docx2txt.config

    # Generate binary wrapper with correct PATH and configuration context
    makeWrapper ${perl}/bin/perl $out/bin/docx2txt \
      --add-flags "$out/libexec/docx2txt.pl" \
      --prefix PATH : ${lib.makeBinPath [ unzip ]}

    runHook postInstall
  '';

  meta = with lib; {
    description = "Perl based command line utility to convert Microsoft DOCX documents to clean text files";
    homepage = "https://sourceforge.net";
    license = licenses.gpl3Plus;
    platforms = platforms.all;
    mainProgram = "docx2txt";
  };
}
