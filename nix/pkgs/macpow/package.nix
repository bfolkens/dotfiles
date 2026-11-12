{
  lib,
  fetchFromGitHub,
  rustPlatform,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "macpow";
  version = "0.1.19";

  src = fetchFromGitHub {
    owner = "k06a";
    repo = "macpow";
    tag = "v${finalAttrs.version}";
    hash = "sha256-4sYG6vbiYWT6w5jGoNHjIva3RahUBwtQgp101xTzfvY=";
  };

  cargoHash = "sha256-bo7jcyfb6XQGiwp1DvRlsY5Ag03zUgc5O6Ovhuwh19U=";

  # Match upstream CI. Integration tests require direct access to hardware sensors.
  cargoTestFlags = [ "--lib" ];

  meta = {
    description = "Real-time power consumption monitor for Apple Silicon Macs";
    homepage = "https://github.com/k06a/macpow";
    license = lib.licenses.mit;
    platforms = [ "aarch64-darwin" ];
    mainProgram = "macpow";
  };
})
