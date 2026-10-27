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
  };

  outputs =
    {
      self,
      nixpkgs,
      nix-darwin,
      elixir-expert-lsp,
      jj-starship,
      krew-nix
    }:
    {
      # scutil --get LocalHostName
      darwinConfigurations."MacBook-Pro" = nix-darwin.lib.darwinSystem {
        specialArgs = { inherit self elixir-expert-lsp jj-starship; };

        modules = [
          ({ pkgs, ... }: {
            nixpkgs.overlays = [
              (final: prev: {
                docx2txt = prev.callPackage ./pkgs/docx2txt/package.nix { };
                ledger-lsp = prev.callPackage ./pkgs/ledger-lsp/package.nix { pkgs = pkgs; };
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
