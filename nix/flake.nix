# Source: https://nixcademy.com/posts/nix-on-macos/
{
  description = "Brad's Nix Configs";

  inputs = {
    nixpkgs = {
      type = "indirect";
      id = "nixpkgs";
    };

    unstable.url = "nixpkgs/nixos-unstable";

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, unstable, nix-darwin }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = with pkgs; [

        # general tools
        atuin
        curl
        eza
        git
        jq
        neovim
        ripgrep
        starship
        tmux
        wget

        # dev tools
        devenv
        pgcli

        # infrastructure
        awscli
        google-cloud-sdk
        kubectl
        terraform

        # programming envs
        # cocoapods
        fastlane
        nodejs
        yarn

      ];

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true;  # default shell on catalina
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      system.defaults = {
        dock.autohide = true;
      #   dock.mru-spaces = false;
        finder.AppleShowAllExtensions = true;
      #   finder.FXPreferredViewStyle = "clmv";
        screencapture.location = "~/Desktop";
      #   screensaver.askForPasswordDelay = 10;
      };

      # homebrew.enable = true;
      # homebrew.taps = [];
      # homebrew.casks = [];
      # homebrew.brews = [];

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      # Allow unfree packages (like terraform)
      nixpkgs.config.allowUnfree = true;
    };
  in
  {
    # First run:
    # $ nix run nix-darwin -- switch --flake .#mbp
    # Rebuild flake using:
    # $ darwin-rebuild switch
    darwinConfigurations."mbp" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."mbp".pkgs;
  };
}
