#!/bin/bash

mkdir ~/.config/zsh

# Completions
if [ ! -d ~/.config/zsh/completions ]; then
  git clone git@github.com:zsh-users/zsh-completions.git ~/.config/zsh/completions
fi
fpath=(~/.config/zsh/completions/src $fpath)

# Autosuggestions
if [ ! -d ~/.config/zsh/autosuggestions ]; then
  git clone git@github.com:zsh-users/zsh-autosuggestions.git ~/.config/zsh/autosuggestions
fi
source ~/.config/zsh/autosuggestions/zsh-autosuggestions.zsh

# Fasd
eval "$(fasd --init auto)"
alias z="fasd_cd -di"

# Syntax Highlighting
if [ ! -d ~/.config/zsh/syntax-highlighting ]; then
  git clone git@github.com:zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/syntax-highlighting
fi
if [[ $ZSH_HIGHLIGHT_REVISION != 'HEAD' ]]; then
  source ~/.config/zsh/syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# History Substring search
if [ ! -d ~/.config/zsh/history-substring-search ]; then
  git clone git@github.com:zsh-users/zsh-history-substring-search.git ~/.config/zsh/history-substring-search
fi
source ~/.config/zsh/history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
