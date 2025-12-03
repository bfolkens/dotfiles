# Source:
#   https://nix-darwin.github.io/nix-darwin/manual/
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

      system.primaryUser = "bfolkens";

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      system.keyboard = {
        enableKeyMapping = true;
        remapCapsLockToControl = true;
      };

      system.defaults = {
        finder.AppleShowAllExtensions = true;
        screencapture.location = "~/Desktop";
      # #   screensaver.askForPasswordDelay = 10;
      };

      system.defaults.dock = {
        autohide = true;
        magnification = true;
        tilesize = 36;
        largesize = 90;
        mru-spaces = false;
        wvous-tl-corner = 13; # lock screen
        wvous-bl-corner = 5; # start screensaver
        wvous-tr-corner = 10; # put display to sleep
        wvous-br-corner = 6; # disable screensaver
        # TODO: https://nix-darwin.github.io/nix-darwin/manual/#opt-system.defaults.dock.persistent-apps
        # persistent-apps = [];
      };

      system.defaults.CustomUserPreferences = {
        "com.apple.Dock" = {
          wvous-tl-modifier = modifiers.cmd;
          wvous-bl-modifier = modifiers.cmd;
          wvous-tr-modifier = modifiers.cmd;
          wvous-br-modifier = modifiers.cmd;
        };
      };

      system.defaults.NSGlobalDomain.AppleSpacesSwitchOnActivate = false;
      system.defaults.NSGlobalDomain."com.apple.swipescrolldirection" = true;

      # homebrew.enable = true;
      # homebrew.taps = [];
      # homebrew.casks = [];
      # homebrew.brews = [];

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      # Allow unfree packages (like terraform)
      nixpkgs.config.allowUnfree = true;
    };

    # for modifier support, check https://github.com/LnL7/nix-darwin/issues/998
    modifiers = {
      none = 0;
      option = 524288;
      cmd = 1048576;
      "option+cmd" = 1573864;
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
