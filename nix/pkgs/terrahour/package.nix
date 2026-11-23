{ pkgs ? import <nixpkgs> {} }:

pkgs.python3Packages.buildPythonApplication {
  pname = "terrahour";
  version = "1.0.9";
  pyproject = true;

  src = pkgs.fetchFromGitHub {
    owner = "ACoci86";
    repo = "terrahour";
    rev = "v1.0.9";
    hash = "sha256-naMh9YAWWSbFSQCcYkIw1dd4b7/73YlUfwFCFT8WeJI=";
  };

  build-system = with pkgs.python3Packages; [
    setuptools
  ];

  # Tests require pytest and pillow if you enable doCheck = true
  doCheck = false;

  meta = with pkgs.lib; {
    description = "World clock for the terminal with a day and night map and a 24-hour timeline";
    homepage = "https://github.com/ACoci86/terrahour";
    license = licenses.mit;
    mainProgram = "terrahour";
  };
}
