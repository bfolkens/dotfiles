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
  ];
}
