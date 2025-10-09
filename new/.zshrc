export LANG=en_US.UTF-8
export EDITOR=nvim
export VISUAL=nvim

source "$HOME/dotfiles/new/.pathrc"
source "$HOME/dotfiles/new/.aliasrc"

# History settings:
HISTFILE="$HOME/.zhistory"
HISTSIZE=10000000
SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY    # Write format.
setopt INC_APPEND_HISTORY  # Write to history file immediately.
setopt SHARE_HISTORY       # Share history between sessions.
setopt HIST_SAVE_NO_DUPS   # No saving of duplicates.
setopt HIST_IGNORE_SPACE   # No saving of events starting with a space.
setopt HIST_FIND_NO_DUPS   # No display of previously found event.
setopt HIST_VERIFY         # No immediate execute on expansion.

# FZF integration:
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Vi-mode:
bindkey -v
bindkey '^P' up-history
bindkey '^N' down-history
export KEYTIMEOUT=1

# Completion:
zmodload zsh/complist
autoload -U compinit && compinit
zstyle ':completion:*' group-name ''
zstyle ':completion:*' format '%B---- %d%b'
zstyle ':completion:*' menu select
zstyle ':completion:*' verbose true
zstyle ':completion:*:warnings' format 'Too bad there is nothing'
export CLICOLOR=1
export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Plugins:
if [ ! -d "$HOME/.zsh/z" ] ; then
  git clone https://github.com/rupa/z "$HOME/.zsh/z"
fi
source "$HOME/.zsh/z/z.sh"
if [ ! -d "$HOME/.zsh/zsh-completions" ] ; then
  git clone https://github.com/zsh-users/zsh-completions "$HOME/.zsh/zsh-completions"
fi
fpath=("$HOME/.zsh/zsh-completions" $fpath)
if [ ! -d "$HOME/.zsh/zsh-autosuggestions" ] ; then
  git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.zsh/zsh-autosuggestions"
fi
source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
if [ ! -d "$HOME/.zsh/zsh-syntax-highlighting" ] ; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting "$HOME/.zsh/zsh-syntax-highlighting"
fi
source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
if [ ! -d "$HOME/.zsh/zsh-history-substring-search" ] ; then
  git clone https://github.com/zsh-users/zsh-history-substring-search "$HOME/.zsh/zsh-history-substring-search"
fi
source "$HOME/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh"
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Automatically ls after cd:
chpwd() { ls }

# Load pure prompt:
if [ ! -d "$HOME/.zsh/pure" ] ; then
  git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
fi
fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure
prompt_pure_state[username]=""
export VIRTUAL_ENV_DISABLE_PROMPT=12

if [ -f "$HOME/.venv/bin/activate" ]; then
  source $HOME/.venv/bin/activate
fi
