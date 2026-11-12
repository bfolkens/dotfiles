{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule (finalAttrs: {
  pname = "wsget";
  version = "0.11.0";

  src = fetchFromGitHub {
    owner = "ksysoev";
    repo = "wsget";
    tag = "v${finalAttrs.version}";
    hash = "sha256-LGrCkpuHGV7rNEeILdEtmOYbViw6fen0/nFEi4FGcs4=";
  };

  vendorHash = "sha256-VJ/LyHzxFk/FPdl2oQJWScMfGB8kAVtERvqo/dtFSsU=";

  subPackages = [ "cmd/wsget" ];
  env.CGO_ENABLED = 0;
  ldflags = [
    "-s"
    "-w"
    "-X main.version=${finalAttrs.version}"
  ];

  meta = {
    description = "Command-line client for WebSocket servers";
    homepage = "https://github.com/ksysoev/wsget";
    license = lib.licenses.mit;
    mainProgram = "wsget";
  };
})
