setopt nobeep histbeep complete_in_word auto_pushd pushd_minus
setopt pushd_ignore_dups extended_glob
setopt no_bg_nice hist_ignore_dups hist_allow_clobber ignore_eof
setopt list_types no_auto_remove_slash no_notify
setopt autocd hist_verify multios
setopt nocorrect clobber

limit coredumpsize 0
umask 022
fignore=(.o ~)

KEYTIMEOUT=1
DIRSTACKSIZE=10
export EDITOR=vim
export VISUAL=vim
export PAGER=less
# export LESS=-MiSXR

#source "${0:h}/completion.zsh"
source "${0:h}/keybindings.zsh"
source "${0:h}/hash-d.zsh"

path+=(
    ~/.local/bin
    ~/bin
    # /usr/local/bin
    # /usr/local/sbin
    )

unalias rm
if [ -r ~/.aliases ]; then
    . ~/.aliases
fi

autoload autobg

function precmd() {
    autobg
}

[ -f ~/.bcrc ] &&  export BC_ENV_ARGS="-l $HOME/.bcrc"

if (( $+commands[ghc] )); then
    NIX_GHC_VERSION=$(ghc --numeric-version)
    export NIX_GHC="$HOME/.nix-profile/bin/ghc"
    export NIX_GHCPKG="$HOME/.nix-profile/bin/ghc-pkg"
    export NIX_GHC_DOCDIR="$HOME/.nix-profile/share/doc/ghc/html"
    export NIX_GHC_LIBDIR="$HOME/.nix-profile/lib/ghc-${NIX_GHC_VERSION}"
fi

if (( $+commands[kubectl] )); then
    source <(kubectl completion zsh)
    alias kc=kubectl
    alias kkc='kubectl --namespace kube-system'
fi
if (( $+commands[helm] )); then
    source <(helm completion zsh)
fi
#
# temp workaround
autoload -U compinit && compinit

