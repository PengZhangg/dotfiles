# Enable Powerlevel10k instant prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Deduplicate PATH early
typeset -U PATH path

# Homebrew
if [[ -f "/opt/homebrew/bin/brew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# PATH
export PYENV_ROOT="$HOME/.pyenv"
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$HOME/.local/bin:/opt/homebrew/opt/ruby/bin:$HOME/.config/emacs/bin:$PNPM_HOME/bin:$PATH"

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
plugins=(git fzf-tab zsh-autosuggestions zsh-syntax-highlighting)
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
source "$ZSH/oh-my-zsh.sh"

# Theme
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory sharehistory hist_ignore_space hist_ignore_all_dups hist_save_no_dups

# Completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Keybindings
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Aliases
alias ls="lsd --group-dirs first"
alias ll="lsd --group-dirs first -la"
alias cd="z"
alias grep="rg"
alias n='nvim'
alias c='clear'
alias gs='git status'

# Integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(pay-respects zsh --alias)"
command -v pyenv &>/dev/null && eval "$(pyenv init -)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
