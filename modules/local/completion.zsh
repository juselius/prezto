# vim:ft=zsh
# zstyle ':completion:*' completer _complete _correct _approximate _prefix
# zstyle ':completion:*:expand:*' tag-order all-expansions original
zstyle ':completion:*' menu select=6
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' completer _complete _correct _prefix
zstyle ':completion:*' list-colors '1'
zstyle ':completion:*' insert-ids menu
zstyle ':completion:*:descriptions' format '-- %B%d%b --'
# zstyle ':completion:*:*:(g|)vim:*' file-patterns \
#        '*.^(o|a|pdf|ps|eps|aux|blg|bbl|toc|log|jpg|png)' '*'
# zstyle ':completion:*:*:evince:*' file-patterns \
#     '*.(pdf|ps|eps)' '*'
zstyle ':completion::complete:-tilde-:*' tag-order \
    named-directories users directory-stack
zstyle ':completion:*' group-name ''

zstyle ':completion:all-matches::::' completer _all_matches _complete
zstyle ':completion:all-matches:*' old-matches true
zstyle ':completion:all-matches:*' insert true
# zle -C all-matches complete-word _generic

autoload -U incremental-complete-word predict-on
zle -N incremental-complete-word
zle -N predict-on
# zle -N predict-off
