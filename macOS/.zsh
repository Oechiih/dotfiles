autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)

eval "$(zoxide init zsh)"
