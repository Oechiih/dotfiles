# History (mirrors PSReadLine options)
HISTFILE=~/.zsh_history
HISTSIZE=400
SAVEHIST=400
setopt HIST_IGNORE_DUPS       # HistoryNoDuplicates
setopt HIST_FIND_NO_DUPS
setopt INC_APPEND_HISTORY     # SaveIncrementally

# Word movement — stop at / . - = _ like VS Code word separators
WORDCHARS='*?[]~&;!#$%^(){}<>'

# Misc
setopt AUTO_CD                # type a dir name to cd into it

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
# HistorySearchCursorMovesToEnd — cursor jumps to end of line after match
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^[[A' history-beginning-search-backward-end   # Up arrow
bindkey '^[[B' history-beginning-search-forward-end    # Down arrow
bindkey '^[[Z' complete-word                           # Shift+Tab — Complete
bindkey '\t'   menu-complete                           # Tab       — MenuComplete
bindkey '^[[1;6D' select-backward-word                 # Ctrl+Shift+Left
bindkey '^[[1;6C' select-forward-word                  # Ctrl+Shift+Right

# Ctrl+G → lazygit
_lazygit_widget() { lazygit; zle reset-prompt }
zle -N _lazygit_widget
bindkey '^G' _lazygit_widget

# Aliases
alias clip='pbcopy'
if command -v eza &>/dev/null; then
  alias ls='eza --icons --git'
  alias ll='eza --icons --git -l'
  alias la='eza --icons --git -la'
  alias tree='eza --icons --tree'
fi

# fzf — fuzzy history (Ctrl+R), file (Ctrl+T), directory (Alt+C)
if [[ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ]]; then
  source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
  source /opt/homebrew/opt/fzf/shell/completion.zsh
fi

# Prompt (mirrors PS prompt: folder icon + path + git icon + branch, then arrow)
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
