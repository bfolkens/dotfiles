{
  pkgs,
  self,
  inputs,
  ...
}:
let
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
  # List packages installed in system profile:
  # $ nix-env -qaP
  # See all the homebrew packages currently installed:
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
    # bzip2 (having issues with lib, include, pkgconfig, etc - need a way to handle this)
    # chrony
    clamav
    colordiff
    csvquote
    darwin.lsusb
    delta
    dive
    docx2txt # old one for publicsalary
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
    # iproute2
    inetutils
    imagemagick
    # impala
    isync
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
    mtr
    ncmpcpp
    neomutt
    nix-search-tv
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
    # pwgen
    pv
    qemu
    qsv
    rar
    rclone
    reattach-to-user-namespace
    riffdiff
    rmlint
    # rmpc
    sd
    sig
    skopeo
    skim
    sox
    sq
    starship
    ticker
    trippy
    ttl
    tidy-viewer
    ugrep
    unar
    viddy
    viu
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
    earthbuild
    emscripten
    esbuild
    # gcc (causes problems with ruby)
    gh
    # gh-dash
    # gh-enhance
    hyperfine
    llvm
    luajit
    mariadb.client
    # mitmproxy
    ngrok
    nodejs
    postgresql_18
    # pgcli
    pgformatter
    pgloader
    # pgrok
    # rosie
    sentry-cli
    stripe-cli
    tbls
    texlab
    tokei
    tsung
    tree-sitter
    typst
    jujutsu
    inputs.jj-starship.packages.${stdenv.hostPlatform.system}.default
    # vector

    # LSPs (should be in dev flake envs)
    air-formatter
    bash-language-server
    dot-language-server
    inputs.elixir-expert-lsp.packages.${stdenv.hostPlatform.system}.default
    # beamMinimal28Packages.expert
    fish-lsp
    # haskell-language-server # installed via ghcup
    ledger-lsp
    lua-language-server
    rust-analyzer
    solargraph
    swiftlint
    swift-format
    tailwindcss-language-server
    terraform-ls
    tinymist
    ty
    typescript-language-server
    yaml-language-server

    # nix dev tools
    nixfmt
    nix-init
    nixd
    nixos-anywhere
    fh
    nurl

    # devops / infra
    cli53
    awscli2
    azure-cli
    (google-cloud-sdk.withExtraComponents (
      with google-cloud-sdk.components;
      [
        gke-gcloud-auth-plugin
      ]
    ))
    google-cloud-sql-proxy
    k9s
    krew
    krew-plugins.view-allocations
    krew-plugins.view-utilization
    kubectx
    kubectl
    packer
    terraform
    terraformer
    oci-cli
  ];

  documentation.enable = true;

  # Auto upgrade nix package
  nix.package = pkgs.nix;

  # If you use determinate systems installer, disable nix's self-update
  nix.enable = true;

  nix.distributedBuilds = true;

  # Enable the linux builder
  nix.linux-builder = {
    enable = true;
    ephemeral = true;
    package = pkgs.darwin.linux-builder-vz;
    systems = [
      "aarch64-linux"
      "x86_64-linux"
    ];

    config.virtualisation = {
      cores = 6;

      darwin-builder = {
        memorySize = 16 * 1024;
        diskSize = 32 * 1024;

        # Trigger GC below 4 GiB; collect until 8 GiB is free.
        min-free = 4 * 1024 * 1024 * 1024;
        max-free = 8 * 1024 * 1024 * 1024;
      };
    };
  };

  nix.settings.trusted-users = [ "@admin" ];

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
    CustomUserPreferences = {
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
              parameters = [
                32
                49
                modifiers."ctrl+cmd"
              ];
              type = "standard";
            };
          };
        };
      };
    };
    dock = {
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
    finder = {
      AppleShowAllExtensions = true;
      FXEnableExtensionChangeWarning = false;
    };
    hitoolbox.AppleFnUsageType = "Do Nothing";
    NSGlobalDomain = {
      AppleShowAllExtensions = true;
      AppleSpacesSwitchOnActivate = false;
      InitialKeyRepeat = 25;
      KeyRepeat = 2;
      "com.apple.swipescrolldirection" = true;
    };
    menuExtraClock = {
      IsAnalog = false;
      Show24Hour = false;
      ShowAMPM = true;
      ShowSeconds = true;
      ShowDate = 0;
      ShowDayOfWeek = false;
      ShowDayOfMonth = false;
      FlashDateSeparators = false;
    };
    screencapture.location = "~/Desktop";
    trackpad.Clicking = true;
    # #   screensaver.askForPasswordDelay = 10;
  };

  homebrew = {
    enable = true;
    onActivation.cleanup = "uninstall";

    taps = [
      "514-labs/tap"
      "bfolkens/tap"
      "ellie/atuin"
      "homebrew/cask"
      "homebrew/core"
      "immanuwell/droast"
      "k06a/tap"
      "ksysoev/wsget"
      "rbenv/tap"
    ];
    casks = [
      "font-monaspace"
      "font-symbols-only-nerd-font"
      "ghostty"
      "little-snitch"
      "taskexplorer"
    ];
    brews = [
      "atuin"
      "gettext"
      "bzip2"
      "certifi"
      "gmp"
      "coreutils"
      "direnv"
      "fish"
      "pcre2"
      "gawk"
      "gnu-sed"
      "icu4c@76"
      "libevent"
      "libxml2"
      "libyaml"
      "mas"
      "mise"
      "mole"
      "mysql-client@8.4"
      "openssl@3"
      "pinentry-mac"
      "pkgconf"
      "sqlite"
      "zlib"
      "514-labs/tap/dnsglobe"
      "immanuwell/droast/droast"
      "k06a/tap/macpow"
      "ksysoev/wsget/wsget"
      "rbenv/tap/openssl@1.1"
    ];

    masApps = {
      "1Password for Safari" = 1569813296;
      "Apple Configurator" = 1037126344;
      "Classic Color Meter" = 451640037;
      "CotEditor" = 1024640650;
      "Developer" = 640199958;
      "DigiDoc4" = 1370791134;
      "Duplicate File Finder" = 1032755628;
      "Exporter" = 1099120373;
      "Free Ruler" = 1483172210;
      "GarageBand" = 682658836;
      "HazeOver" = 430798174;
      "iA Writer" = 775737590;
      "iMovie" = 408981434;
      "iStat Menus" = 1319778037;
      "KakaoTalk" = 869223134;
      "Keynote" = 409183694;
      "Kindle" = 302584613;
      "Numbers" = 409203825;
      "Pages" = 409201541;
      "Paprika Recipe Manager 3" = 1303222628;
      "Parcel" = 375589283;
      "Phone.com" = 1441327945;
      "RadarScope" = 288419283;
      "Reeder" = 6475002485;
      "RUMlogNG" = 964454561;
      "Serial" = 877615577;
      "Telegram" = 747648890;
      "Things" = 904280696;
      "Web eID" = 1576665083;
      "Windows App" = 1295203466;
      "Xcode" = 497799835;
    };
  };

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Allow unfree packages (like terraform)
  nixpkgs.config.allowUnfree = true;
}
