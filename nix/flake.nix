# Source:
#   https://nix-darwin.github.io/nix-darwin/manual/
#   https://nixcademy.com/posts/nix-on-macos/
#   https://blog.dbalan.in/blog/2024/03/25/boostrap-a-macos-machine-with-nix/index.html
{
  description = "Brad's MacBook Pro";

  inputs = {
    # Package sets
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # Environment/system management
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Other sources
    elixir-expert-lsp.url = "github:elixir-lang/expert";
    jj-starship.url = "github:dmmulroy/jj-starship";
    krew-nix.url = "github:n-at-han-k/krew.nix";
    mole.url = "github:tw93/Mole";
    dnsglobe.url = "github:514-labs/dnsglobe";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nix-darwin,
      krew-nix,
      ...
    }:
    {
      # scutil --get LocalHostName
      darwinConfigurations."MacBook-Pro" = nix-darwin.lib.darwinSystem {
        specialArgs = { inherit self inputs; };

        modules = [
          ({ pkgs, ... }: {
            nixpkgs.overlays = [
              (final: prev: {
                docx2txt = prev.callPackage ./pkgs/docx2txt/package.nix { };
                ledger-lsp = prev.callPackage ./pkgs/ledger-lsp/package.nix { pkgs = pkgs; };
                # Fix python3.14-fabric-3.2.3 build issues
                pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
                  (self: super: {
                    reuse = super.reuse.overridePythonAttrs (old: {
                      __structuredAttrs = false;
                    });
                    invoke = super.invoke.overridePythonAttrs (old: {
                      version = "2.2.1";
                      pyproject = null;
                      format = "setuptools";
                      src = final.fetchPypi {
                        pname = "invoke";
                        version = "2.2.1";
                        hash = "sha256-UVv0m0pIkyt5sCRZA0jaIvOcSULf+ZGtH7i4uuob5wc=";
                      };
                    });
                  })
                ];
              })
              krew-nix.overlays.default
            ];
          })
          ./hosts/MacBook-Pro/configuration.nix
          ./modules/common.nix
        ];
      };

      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations."MacBook-Pro".pkgs;
    };
}
