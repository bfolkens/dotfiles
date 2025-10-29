# vim:ft=zsh:ts=2:sw=2:sts:et:
# zmodload zsh/zprof

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LANG="en_US.UTF-8"
# export TERM="xterm-256color"

# Favorite keybindings
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

# Fix ctrl-o for neomutt
stty discard undef

export EDITOR='nvim'
export MAILDIR="$HOME/Mail"

# PATH
export PATH="/usr/local/sbin:$HOME/local/bin:/usr/local/opt/bin:$PATH"

# Compilation flags
export ARCHFLAGS="-Os -arch x86_64 -fno-common"

# ssh
export SSH_KEY_PATH="~/.ssh/id_ed25519.pub"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"

# Load all files in aliases.d
for file in ~/.dotfiles/aliases.d/* ; do
  if [ -f "$file" ] ; then
    . "$file"
  fi
done

#
# CUSTOM
#

unsetopt share_history

# GPG
export GPG_TTY=$(tty)

# Kubernetes
# This was super slow
#source <(kubectl completion zsh)

# google-cloud-sdk
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

# XCode dev env
# export SDKROOT=$(xcrun --show-sdk-path)
# Above is slow to wait each time on ZSH start, just copy below
export SDKROOT=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk

# Android Studio
export ANDROID_HOME="/opt/homebrew/share/android-sdk"
export ANDROID_SDK_ROOT="/opt/homebrew/share/android-sdk"

# OpenSSL tools
export PATH="/opt/homebrew/opt/openssl/bin:$PATH"

# go
export GOENV="$HOME/go"

# Skim (sk)
export SKIM_DEFAULT_COMMAND="fd --type f || rg --files || ag -l -g \"\" || find ."

# default tmux

#if [ -z "$TMUX" ]; then
#  tmux attach -t default || tmux new -s default
#fi

# Returns whether the given command is executable or aliased.
_has() {
  return $( whence $1 >/dev/null )
}

# Returns whether the given statement executed cleanly. Try to avoid this
# because this slows down shell loading.
_try() {
  return $( eval $* >/dev/null 2>&1 )
}

# Returns whether the current host type is what we think it is. (HOSTTYPE is
# set later.)
_is() {
  return $( [ "$HOSTTYPE" = "$1" ] )
}

# Returns whether out terminal supports color.
_color() {
  return $( [ -z "$INSIDE_EMACS" ] )
}

# direnv
eval "$(/opt/homebrew/bin/direnv hook zsh)"

# brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# zoxide
eval "$(zoxide init zsh)"

# zprof

# atuin
eval "$(atuin init zsh)"
