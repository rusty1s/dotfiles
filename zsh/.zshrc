# source prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# source fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export DEFAULT_USER="rusty1s"
export DOTFILES=$HOME/dotfiles

# adding path directory for custom scripts
export PATH=$DOTFILES/bin:$PATH

alias zshrc="vim ~/.zshrc"
alias reload="source ~/.zshrc"
alias prezto="vim ~/.zpreztorc"

alias vssh="cd $HOME/vagrant && vagrant ssh"

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd.mm.yyyy"
