# History (mirrors PSReadLine options)
HISTFILE=~/.zsh_history
HISTSIZE=400
SAVEHIST=400
setopt HIST_IGNORE_DUPS       # HistoryNoDuplicates
setopt HIST_FIND_NO_DUPS
setopt INC_APPEND_HISTORY     # SaveIncrementally

# Ensure Homebrew is on PATH (for non-login shells)
[[ -f /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"

# Completion
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

if command -v carapace &>/dev/null; then
  export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
  zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
  source <(carapace _carapace)
fi

# Key bindings (mirrors PSReadLine handlers)
bindkey '^[[A' history-search-backward    # Up arrow   — HistorySearchBackward
bindkey '^[[B' history-search-forward     # Down arrow — HistorySearchForward
bindkey '^[[Z' complete-word              # Shift+Tab  — Complete
bindkey '\t'   menu-complete              # Tab        — MenuComplete
bindkey '^[[1;6D' select-backward-word    # Ctrl+Shift+Left  — SelectShellBackwardWord
bindkey '^[[1;6C' select-forward-word     # Ctrl+Shift+Right — SelectShellForwardWord

# Ctrl+G → lazygit (mirrors Ctrl+g PSReadLine binding)
_lazygit_widget() { lazygit; zle reset-prompt }
zle -N _lazygit_widget
bindkey '^G' _lazygit_widget

# Aliases
alias clip='pbcopy'

# Prompt (mirrors PS prompt structure: icon + path + branch icon + branch, then ❯)
autoload -Uz vcs_info
precmd_functions+=( vcs_info )
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '%b'
setopt PROMPT_SUBST

_git_segment() {
  [[ -n $vcs_info_msg_0_ ]] && echo "  %F{blue}   %f%F{green}${vcs_info_msg_0_}%f"
}

PROMPT='%F{blue}  %f%~$(_git_segment)
%(?.%F{blue}.%F{red}) %f'

RPROMPT=''

# Zoxide (must be last)
command -v zoxide &>/dev/null && eval "$(zoxide init zsh)"
