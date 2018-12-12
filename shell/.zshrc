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
export PATH="$PATH:$DOTFILES/bin:$(yarn global bin)"
export PATH="$PATH:$HOME/.config/yarn/global/node_modules/.bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:/usr/local/cuda/bin"
export PATH="/Users/rusty1s/miniconda3/bin:$PATH"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda/lib64"

export CDPATH=".:$HOME:$DOTFILES:$GITHUB:$CDPATH"
export VIRTUAL_ENV_DISABLE_PROMPT=1

alias vi=$EDITOR
alias vim=$EDITOR
alias sudo="sudo -E"
alias reload="exec zsh"
alias mkdir="mkdir -p"
alias grep="rg"
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
setopt HIST_FIND_NO_DUPS   # No display of previously found event.
setopt HIST_VERIFY         # No immediate execute on expansion.

fpath=("$HOME/.config/yarn/global/node_modules/pure-prompt/functions" $fpath)
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

if [ -f "$HOME/torch/install/bin/torch-activate" ]; then
  source "$HOME/torch/install/bin/torch-activate"
fi

if on_ubuntu; then
  bindkey '^[OA' history-substring-search-up
  bindkey '^[OB' history-substring-search-down
else
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
fi

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f ~/.proxy.sh ] && source ~/.proxy.sh

eval $(thefuck --alias)

# if ! on_mac; then
#   evenbetterls="$HOME/.config/sh/even-better-ls/append_to_profile.sh"
#   [ -f "$evenbetterls" ] && source "$evenbetterls"
# fi

if on_mac; then
  alias ls="ls -AFG"
else
  alias ls="ls -AF --color=always"
fi

# Automatically ls after cd.
chpwd() { ls }
