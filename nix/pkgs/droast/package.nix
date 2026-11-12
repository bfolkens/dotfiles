{
  lib,
  fetchFromGitHub,
  rustPlatform,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "droast";
  version = "1.7.0";

  src = fetchFromGitHub {
    owner = "immanuwell";
    repo = "dockerfile-roast";
    tag = finalAttrs.version;
    hash = "sha256-K5QrUwGVt8x5yF/dBPUmfpLy8lGmv3CZrDGxn83upfc=";
  };

  cargoHash = "sha256-bFG4/c294XQ9oFUPtF8A/dKIOjj1WDK3s7nEHeuDLIU=";

  preCheck = ''
    # The source archive has no Git metadata, so mark the fixture as a
    # repository so the .gitignore works.
    mkdir -p tests/fixtures/repository-awareness/.git
  '';

  meta = {
    description = "Dockerfile linter that catches bad practices";
    homepage = "https://github.com/immanuwell/dockerfile-roast";
    license = lib.licenses.mit;
    mainProgram = "droast";
  };
})
