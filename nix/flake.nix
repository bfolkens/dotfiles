# Source:
#   https://nixcademy.com/posts/nix-on-macos/
#   https://blog.dbalan.in/blog/2024/03/25/boostrap-a-macos-machine-with-nix/index.html
# First run:
# $ nix run nix-darwin -- switch --flake .
# Rebuild flake using:
# $ darwin-rebuild switch --flake .
# Updates?
# $ nix flake update
{
  description = "Brad's MacBook Pro";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      # See all the homebrew packages currently installed
      # $ brew leaves
      environment.systemPackages = with pkgs; [
        # general tools
        aria2
        # atuin
        bat
        colordiff
        curl
        dive
        dust
        eza
        fd
        ffmpeg-headless
        fzf
        # ghostty
        imagemagick
        isync
        jq
        ledger
        lla
        miller
        msmtp
        neofetch
        neomutt
        neovim
        ookla-speedtest
        pwgen
        pv
        ripgrep
        sd
        skim
        sq
        # starship
        tmux
        wget
        xan
        yazi
        yubikey-manager

        # global dev tools
        # (otherwise put into project flake)
        act
        earthly
        git
        gh
        pgcli
        pgloader
        tbls
        tokei
        tsung
        jujutsu

        # nix dev tools
        nixfmt-rfc-style
        nix-init
        nixd
        fh
        nurl

        # devops / infra
        cli53
        awscli2
        azure-cli
        # google-cloud-sdk
        kubectx
        kubectl
        terraform
        terraformer
        oci-cli
      ];

      # Auto upgrade nix package
      # nix.package = pkgs.nix;

      # If you use determinate systems installer, disable nix's self-update
      nix.enable = true;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true;  # default shell on catalina
      programs.fish.enable = true;
      # programs.direnv = {
      #   enable = true;
      #   nix-direnv.enable = true;
      # };

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # system.defaults = {
      #   dock.autohide = true;
      # #   dock.mru-spaces = false;
      #   finder.AppleShowAllExtensions = true;
      # #   finder.FXPreferredViewStyle = "clmv";
      #   screencapture.location = "~/Desktop";
      # #   screensaver.askForPasswordDelay = 10;
      # TODO: map caps lock to left ctrl key
      # TODO: mouse scroll trackpad backwards
      # };

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
    # scutil --get LocalHostName
    #
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .
    darwinConfigurations."MacBook-Pro" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."MacBook-Pro".pkgs;
  };
}
