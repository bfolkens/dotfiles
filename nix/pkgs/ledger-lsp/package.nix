{
  pkgs ? import <nixpkgs> { },
}:

pkgs.rustPlatform.buildRustPackage rec {
  pname = "ledger-lsp";
  version = "master";

  src = pkgs.fetchFromGitHub {
    owner = "bsilvereagle";
    repo = "ledger-lsp";
    rev = "91691be3546bea2b73eeeafe9afca7d5a73f60df";
    sha256 = "sha256-8SHSN/AMxI+I4vbukw9p4+2wcpKEe49z8+poDxUuOc8=";
  };

  cargoLock = {
    lockFile = "${src}/Cargo.lock";

    outputHashes = {
      "tree-sitter-ledger-0.0.1" = "sha256-L2xUTItnQ/bcieasItrozjAEJLm/fsUUyMex2juCnjw=";
    };
  };

  meta = with pkgs.lib; {
    description = "Language Server Protocol for ledger-cli";
    homepage = "https://github.com/bsilvereagle/ledger-lsp";
    license = licenses.mit;
  };
}
