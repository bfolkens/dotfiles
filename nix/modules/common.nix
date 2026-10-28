{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # general tools
    curl
    jq
    neovim
    ripgrep
    tmux
    tree
    watch
    wget

    # dev tools
    git
    git-lfs
    just
  ];

  programs.bash.enable = true;
  programs.fish.enable = true;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";
}
