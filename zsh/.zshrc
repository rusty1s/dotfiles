export DEFAULT_USER="rusty1s"

export DOTFILES=$HOME/dotfiles
export ZSH=/Users/rusty1s/.oh-my-zsh

# adding path directory for custom scripts
export PATH=~$DOTFILES/bin:$PATH

ZSH_THEME="agnoster"

# source "$(brew --prefix)/etc/profile.d/z.sh"

alias zshrc="vim ~/.zshrc"
alias reload="source ~/.zshrc"

source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# enable command auto-correction
ENABLE_CORRECTION="true"

# display red dots whilst waiting for completion
COMPLETION_WAITING_DOTS="true"

# change the command execution time stamp shown in the history command output
HIST_STAMPS="dd.mm.yyyy"

plugins=(git node npm brew osx)
