#!/bin/zsh

export TERM="xterm-256color-italic"

export SVN=~/svn
export PATH="$HOME/.gem/ruby/2.4.0/bin:$PATH"
export CDPATH="$SVN:$CDPATH"

alias mvni="mvn clean install -DskipTests"
alias mvnt="mvn test -Dtest=FitNesseWikiStart"

# Pure prompt.
fpath=(~/.config/yarn/global/node_modules/pure-prompt/functions $fpath)

# Python 3 Virtualenv.
if [ ! -d ~/venv ]; then
  virtualenv ~/venv
  source ~/venv/bin/activate
  pip install -r ~/dotfiles/zshrc/requirements.txt
else
  source ~/venv/bin/activate
fi

source ~/dotfiles/zshrc/base.zsh