export LANG=en_US.UTF-8

# https://geoff.greer.fm/lscolors/
export CLICOLOR=1
export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

export DOTFILES=~/dotfiles
export GITHUB=~/github

export PATH="$PATH:$DOTFILES/bin:$(yarn global bin)"
export CDPATH=".:$HOME:$DOTFILES:$GITHUB:$CDPATH"
export EDITOR=vim
export VISUAL=vim
export VIRTUAL_ENV_DISABLE_PROMPT=1

alias vi=nvim
alias vim=nvim
alias vimrc="$EDITOR $DOTFILES/vim/init.vim"
alias tmuxconf="$EDTIOR ~/.tmux.conf"
alias zshrc="$EDITOR ~/.zshrc"
alias homebrew="$EDITOR $DOTFILES/macos/brew.sh"
alias shell="$EDITOR $DOTFILES/macos/shell.sh"
alias hyper="$EDITOR ~/.hyper.js"
alias reload="source ~/.zshrc"
alias mkdir="mkdir -p"
alias grep="rg"
alias ls="ls -AF"
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias gs="git status"
alias ga="git add"
alias gall="git add . -A"
alias gc="git commit -m"
alias gp="git push"
alias py="python"

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

# Pure Prompt
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

# Plugins
source $DOTFILES/zshrc/plugins.zsh
