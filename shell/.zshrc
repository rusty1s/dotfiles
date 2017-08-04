export LANG=en_US.UTF-8

# https://geoff.greer.fm/lscolors/
. $HOME/dotfiles/vars.sh
. $HOME/dotfiles/helper/os.sh

if on_mac; then
  export TERM="xterm-256color-italic"
fi

export CLICOLOR=1
export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

export EDITOR=nvim
export VISUAL=nvim

export GITHUB=~/github
export PATH="$PATH:$DOTFILES/bin:$(yarn global bin):$HOME/.config/yarn/global/node_modules/.bin"
export CDPATH=".:$HOME:$DOTFILES:$GITHUB:$CDPATH"
export VIRTUAL_ENV_DISABLE_PROMPT=1

alias vi=$EDITOR
alias vim=$EDITOR
alias sudo="sudo -E"
alias reload="exec zsh"
alias mkdir="mkdir -p"
alias grep="rg"
if on_mac; then
  alias ls="ls -AFG"
else
  alias ls="ls -AF --color=always"
fi
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias gs="git status"
alias ga="git add"
alias gall="git add . -A"
alias grm="git rm -r"
alias gc="git commit -m"
alias gp="git push"
alias py="python"
alias shellcheck="shellcheck -x"

# Automatically ls after cd.
chpwd() { ls }

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# History settings
HISTFILE=~/.zhistory
HISTSIZE=10000000
SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY    # Write format.
setopt INC_APPEND_HISTORY  # Write to history file immediately.
setopt SHARE_HISTORY       # Share history between sessions.
setopt HIST_SAVE_NO_DUPS   # No saving of duplicates.
setopt HIST_IGNORE_SPACE   # No saving of events starting with a space.
setopt HIST_FIND_NO_DUPS   # No display of prevously found event.
setopt HIST_VERIFY         # No immediate execute on expansion.

fpath=("$(yarn global bin)/node_modules/pure-prompt/functions" $fpath)
autoload -U promptinit; promptinit
prompt pure

# Completion
zmodload zsh/complist
autoload -U compinit && compinit

zstyle ':completion:*' group-name ''
zstyle ':completion:*' format '%B---- %d%b'
zstyle ':completion:*' menu select
zstyle ':completion:*' verbose true
zstyle ':completion:*:warnings' format 'Too bad there is nothing'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR"  -eq 1 ]; then
  exec startx &> /dev/null
fi

source ~/.config/sh/z/z.sh
fpath=(~/.config/zsh/completions/src $fpath)
source ~/.config/zsh/autosuggestions/zsh-autosuggestions.zsh
if [[ $ZSH_HIGHLIGHT_REVISION != 'HEAD' ]]; then
  source ~/.config/zsh/syntax-highlighting/zsh-syntax-highlighting.zsh
fi
source ~/.config/zsh/history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

if [ -f "$PYTHON_VENV/$PYTHON_VENV_VERSION/bin/activate" ]; then
  source "$PYTHON_VENV/$PYTHON_VENV_VERSION/bin/activate"
fi

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if command -v rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi

[ -f ~/.proxy.sh ] && source ~/.proxy.sh
