{ pkgs, inputs, ... }:
{
  environment = {
    shellAliases = {
      l = "eza -la --git";
      t = "eza -T";
      vi = "nvim";
    };

    systemPackages = with pkgs; [
      # general tools
      atuin
      bat
      curl
      fd
      inputs.dnsglobe.packages.${stdenv.hostPlatform.system}.default
      jq
      # minus
      less
      moor
      neovim
      ripgrep
      skim
      tmux
      tree
      ugrep
      watch
      wget
      zoxide

      # dev tools
      git
      git-lfs
      just
    ];

    variables = {
      PAGER = "less";
      EDITOR = "nvim";
      VISUAL = "nvim";
      SKIM_DEFAULT_COMMAND = "fd --type f || rg --files || find .";
    };
  };

  programs.bash.enable = true;
  programs.fish.enable = true;

  programs.direnv = {
    enable = true;
    nix-direnv = {
      enable = true;
      # Backport the fix for cached shells triggering reloads in other tabs.
      # Remove once nixpkgs includes https://github.com/nix-community/nix-direnv/pull/790.
      package =
        if pkgs.nix-direnv.version == "3.2.0" then
          pkgs.nix-direnv.override {
            # Patch the release source before resholve processes the installed script.
            fetchFromGitHub =
              args:
              pkgs.applyPatches {
                src = pkgs.fetchFromGitHub args;
                patches = [
                  (pkgs.fetchpatch {
                    url = "https://github.com/nix-community/nix-direnv/commit/94e4fe0c96eb995cc29725e09cd7168b8e7fe886.patch";
                    hash = "sha256-nhIKPK3Mw6y3Ef5c0M51Pm1IAyeWPm1qeA++UXUfbY4=";
                  })
                ];
              };
          }
        else
          pkgs.nix-direnv;
    };
  };

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";
}
