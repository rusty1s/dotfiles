#!/bin/bash

mkdir -p ~/.config/sh

# Z - jump around
if [ ! -d ~/.config/sh/z ]; then
  git clone https://github.com/rupa/z ~/.config/sh/z
fi
source ~/.config/sh/z/z.sh

mkdir -p ~/.config/zsh

# Completions
if [ ! -d ~/.config/zsh/completions ]; then
  git clone https://github.com/zsh-users/zsh-completions ~/.config/zsh/completions
fi
fpath=(~/.config/zsh/completions/src $fpath)

# Autosuggestions
if [ ! -d ~/.config/zsh/autosuggestions ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/autosuggestions
fi
source ~/.config/zsh/autosuggestions/zsh-autosuggestions.zsh

# Syntax Highlighting
if [ ! -d ~/.config/zsh/syntax-highlighting ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.config/zsh/syntax-highlighting
fi
if [[ $ZSH_HIGHLIGHT_REVISION != 'HEAD' ]]; then
  source ~/.config/zsh/syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# History Substring search
if [ ! -d ~/.config/zsh/history-substring-search ]; then
  git clone https://github.com/zsh-users/zsh-history-substring-search ~/.config/zsh/history-substring-search
fi
source ~/.config/zsh/history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
