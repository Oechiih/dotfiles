{ config, ... }: {
  programs.zsh = {
    enable = true;
    autocd = true;
    # Pin the pre-26.05 default (home directory) explicitly now that
    # home-manager warns the default is changing, so behavior doesn't
    # shift out from under us on a future home-manager update.
    dotDir = config.home.homeDirectory;

    history = {
      size = 10000;
      save = 10000;
      ignoreDups = true;
      ignoreSpace = true;
      share = true;
    };

    shellAliases = {
      clip = "pbcopy";
      ls   = "eza --icons --git";
      ll   = "eza --icons --git -l";
      la   = "eza --icons --git -la";
      tree = "eza --icons --tree";
    };

    initContent = ''
      WORDCHARS='*?[]~&;!#$%^(){}<>'

      # Completion
      autoload -U +X compinit && compinit
      autoload -U +X bashcompinit && bashcompinit

      # Carapace
      if command -v carapace &>/dev/null; then
        export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
        zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
        source <(carapace _carapace)
      fi

      # Key bindings
      autoload -U history-search-end
      zle -N history-beginning-search-backward-end history-search-end
      zle -N history-beginning-search-forward-end history-search-end
      bindkey '^[[A'    history-beginning-search-backward-end
      bindkey '^[[B'    history-beginning-search-forward-end
      bindkey '^[[Z'    complete-word
      bindkey '\t'      menu-complete
      bindkey '^[[1;6D' select-backward-word
      bindkey '^[[1;6C' select-forward-word

      _lazygit_widget() { lazygit; zle reset-prompt }
      zle -N _lazygit_widget
      bindkey '^G' _lazygit_widget

      # Nerd Font icons via ANSI-C quoting — the two single quotes in $'\uXXXX'
      # are separated by \uXXXX so they never form the ''' Nix string terminator
      _icon_folder=$''
      _icon_git=$''
      _icon_arrow=$''

      autoload -Uz vcs_info
      precmd_functions+=( vcs_info )
      zstyle ':vcs_info:*' enable git
      zstyle ':vcs_info:git:*' formats '%b'
      setopt PROMPT_SUBST

      _git_segment() {
        [[ -n $vcs_info_msg_0_ ]] && echo "  %F{blue}$_icon_git %f%F{green}$vcs_info_msg_0_%f"
      }

      # Single-quoted PROMPT — PROMPT_SUBST re-evaluates $var and $(...) at each draw
      PROMPT='%F{blue}$_icon_folder%f %~$(_git_segment)
%(?.%F{blue}$_icon_arrow.%F{red}$_icon_arrow)%f '
      RPROMPT=""
    '';
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
