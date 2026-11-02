{ pkgs, inputs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      # general tools
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
    nix-direnv.enable = true;
  };

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";
}
