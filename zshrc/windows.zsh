export TERM="cygwin"
export PATH="$PATH:$HOME/.cargo/bin"

export SVN=~/svn
export CDPATH="$SVN:$CDPATH"

fpath=(~/.nvm/versions/node/v7.9.0/lib/node_modules/pure-prompt/functions $fpath)
source ~/.nvm/nvm.sh

source ~/dotfiles/zshrc/base.zsh
