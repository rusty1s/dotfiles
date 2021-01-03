export LANG=en_US.UTF-8
export EDITOR=nvim
export VISUAL=nvim

source "$HOME/dotfiles/junest/.pathrc"
source "$HOME/dotfiles/junest/.aliasrc"

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

# Vi-mode.
bindkey -v
bindkey '^P' up-history
bindkey '^N' down-history
export KEYTIMEOUT=1

# Completion.
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

# Plugins.
if [ ! -d "$JUNEST_PREFIX/usr/share/zsh/plugins/z" ] ; then
  git clone https://github.com/rupa/z "$JUNEST_PREFIX/usr/share/zsh/plugins/z"
fi
source "$JUNEST_PREFIX/usr/share/zsh/plugins/z/z.sh"
fpath=("$JUNEST_PREFIX/usr/share/zsh/plugins/zsh-completions" $fpath)
source "$JUNEST_PREFIX/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$JUNEST_PREFIX/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$JUNEST_PREFIX/usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh"
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Automatically ls after cd.
chpwd() { ls }

# Load pure prompt.
#
#
if [ ! -d "$JUNEST_PREFIX/usr/share/zsh/plugins/pure" ] ; then
  git clone https://github.com/sindresorhus/pure "$JUNEST_PREFIX/usr/share/zsh/plugins/pure"
fi

# source "$JUNEST_PREFIX/lib/node_modules/pure-prompt/async.zsh"
# source "$JUNEST_PREFIX/lib/node_modules/pure-prompt/pure.zsh"
fpath=("$JUNEST_PREFIX/usr/share/zsh/plugins/pure" $fpath)
autoload -U promptinit; promptinit
prompt pure
if [ "$OS" = "linux" ]; then prompt_pure_state[username]=%F{242}ssh%f; fi

# SSH.
if [ "$OS" = "linux" ]; then
  keychain "$HOME/.ssh/id_rsa" 2>/dev/null
  source "$HOME/.keychain/lalla-sh"
fi
