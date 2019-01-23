export LANG=en_US.UTF-8
export EDITOR=nvim
export VISUAL=nvim

source "$HOME/dotfiles/ubuntu/.pathrc"
source "$DOTFILES/ubuntu/.aliasrc"

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# History settings.
HISTFILE=~/.zhistory
HISTSIZE=10000000
SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY    # Write format.
setopt INC_APPEND_HISTORY  # Write to history file immediately.
setopt SHARE_HISTORY       # Share history between sessions.
setopt HIST_SAVE_NO_DUPS   # No saving of duplicates.
setopt HIST_IGNORE_SPACE   # No saving of events starting with a space.
setopt HIST_FIND_NO_DUPS   # No display of previously found event.
setopt HIST_VERIFY         # No immediate execute on expansion.

# FZF integration.
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Automatically ls after cd.
chpwd() { ls }

# Vi-mode.
bindkey -v
export KEYTIMEOUT=1

function zle-line-init zle-keymap-select {
  VIM_PROMPT="%F{yellow}-- NORMAL--%f"
  RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}"
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

bindkey '^P' up-history
bindkey '^N' down-history

# Load pure prompt.
fpath+=("$HOMEBREW_PREFIX/lib/node_modules/pure-prompt/functions")
autoload -U promptinit; promptinit
prompt pure
