{
  lib,
  fetchFromGitHub,
  buildGoModule,
  versionCheckHook,
  writableTmpDirAsHomeHook,
}:

buildGoModule (finalAttrs: {
  pname = "gh-enhance";
  version = "0.5.1";

  src = fetchFromGitHub {
    owner = "dlvhdr";
    repo = "gh-enhance";
    rev = "v${finalAttrs.version}";
    hash = "sha256-IHtI8wnPLMkqxdBFXqkt6inYMOIqKjdTKdZbTxIhPzo=";
  };

  vendorHash = "sha256-rgql0vsHAzWeubw4EYBu/yPmm2QeADsIeACWsbcWtSk=";

  ldflags = [
    "-s"
    "-w"
    "-X github.com/dlvhdr/gh-enhance/v4/cmd.Version=${finalAttrs.version}"
  ];

  nativeCheckInputs = [ writableTmpDirAsHomeHook ];
  nativeInstallCheckInputs = [ versionCheckHook ];
  doInstallCheck = false;

  meta = {
    changelog = "https://github.com/dlvhdr/gh-enhance/releases/tag/${finalAttrs.src.rev}";
    description = "A Blazingly Fast Terminal UI for GitHub Actions";
    homepage = "https://www.gh-enhance.dev";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ amesgen ];
    mainProgram = "gh-enhance";
  };
})
