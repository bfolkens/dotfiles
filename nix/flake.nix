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
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, elixir-expert-lsp, jj-starship }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      # See all the homebrew packages currently installed
      # $ brew leaves
      environment.systemPackages = with pkgs; [
        # general tools
        _1password-cli
        age
        aria2
        aspell
        # TODO: atuin doesn't seem to work right (needs a background service
        # too it looks like)
        bat
        # bibiman
        bore-cli
        bottom
        brotli
        bzip2
        # chrony
        clamav
        colordiff
        csvquote
        curl
        darwin.lsusb
        delta
        dive
        dos2unix
        dua
        duf
        dust
        dutree
        entr
        erdtree
        # eilmeldung
        exiftool
        eza
        fastfetch
        fd
        ffmpeg-headless
        fzf
        # ghostty
        ghostscript
        glances
        gpgme
        gpgmepp
        gping
        gnupg
        gnuplot
        graphicsmagick
        graphviz
        grex
        groff
        hdf5
        hex
        himalaya
        hwatch
        htop
        iperf3
        inetutils
        imagemagick
        # impala
        isync
        jq
        kondo
        ledger
        libheif
        libtiff
        libwebp
        lima
        lz4
        lnav
        # lm_sensors
        lla
        miller
        # mole
        moreutils
        # mpd
        msmtp
        ncmpcpp
        neomutt
        neovim
        nms
        notmuch
        nvd
        ookla-speedtest
        oxipng
        p7zip
        pinentry-curses
        pop
        poppler
        poppler-utils
        procs
        psutils
        pwgen
        pv
        qemu
        qsv
        rar
        rclone
        reattach-to-user-namespace
        riffdiff
        ripgrep
        rmlint
        # rmpc
        sd
        sig
        skim
        sox
        sq
        starship
        ticker
        tmux
        tree
        trippy
        tidy-viewer
        ugrep
        unar
        viddy
        viu
        watch
        wget
        websocat
        weechat
        # wiremix
        # whosthere
        xan
        xz
        yazi
        yt-dlp
        yubikey-manager
        zoxide
        zstd

        # global dev tools
        # (otherwise put into project flake)
        act
        bun
        cmake
        earthly
        emscripten
        esbuild
        gcc
        git
        git-lfs
        gh
        # gh-dash
        # gh-enhance
        hyperfine
        just
        llvm
        luajit
        mariadb
        mitmproxy
        ngrok
        nodejs
        postgresql
        pgcli
        pgformatter
        # pgloader
        # pgrok
        # rosie
        stripe-cli
        tbls
        texlab
        tokei
        tsung
        tree-sitter
        jujutsu
        jj-starship.packages.${stdenv.hostPlatform.system}.default

        # LSPs (should be in dev flake envs)
        air-formatter
        bash-language-server
        dot-language-server
        elixir-expert-lsp.packages.${stdenv.hostPlatform.system}.default
        fish-lsp
        lua-language-server
        rust-analyzer
        solargraph
        swiftlint
        swift-format
        tailwindcss-language-server
        terraform-ls
        ty
        typescript-language-server

        # nix dev tools
        nixfmt
        nix-init
        nixd
        fh
        nurl

        # devops / infra
        cli53
        awscli2
        azure-cli
        (google-cloud-sdk.withExtraComponents(
          with google-cloud-sdk.components; [
            gke-gcloud-auth-plugin
          ]
        ))
        google-cloud-sql-proxy
        k9s
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
        controlcenter.BatteryShowPercentage = false;
        finder.AppleShowAllExtensions = true;
        hitoolbox.AppleFnUsageType = "Do Nothing";
        menuExtraClock.IsAnalog = true;
        screencapture.location = "~/Desktop";
        trackpad.Clicking = true;
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
        "com.apple.finder" = {
          WarnOnEmptyTrash = false;
        };
        "com.apple.Spotlight" = {
          MenuItemHidden = 1;
        };
        "com.apple.symbolichotkeys" = {
          AppleSymbolicHotkeys = {
            "64" = {
              enabled = true;
              value = {
                parameters = [32 49 modifiers."ctrl+cmd"];
                type = "standard";
              };
            };
          };
        };
      };
      system.defaults.finder.FXEnableExtensionChangeWarning = false;

      system.defaults.NSGlobalDomain = {
        AppleShowAllExtensions = true;
        AppleSpacesSwitchOnActivate = false;
        InitialKeyRepeat = 25;
        KeyRepeat = 2;
        "com.apple.swipescrolldirection" = true;
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

    # for modifier support, check https://github.com/LnL7/nix-darwin/issues/998
    modifiers = {
      none = 0;
      option = 524288;
      cmd = 1048576;
      "option+cmd" = 1573864;
      "ctrl+cmd" = 1310720;
    };
  in
  {
    # scutil --get LocalHostName
    darwinConfigurations."MacBook-Pro" = nix-darwin.lib.darwinSystem {
      modules = [
        # ({ pkgs, ... }: {
        #   nixpkgs.overlays = [
        #     (final: prev: {
        #       gh-enhance = prev.callPackage ./pkgs/gh-enhance/package.nix { };
        #     })
        #   ];
        # })
        configuration
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."MacBook-Pro".pkgs;
  };
}
