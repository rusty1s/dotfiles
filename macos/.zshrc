export LANG=en_US.UTF-8

export EDITOR=nvim
export VISUAL=nvim
export DOTFILES=~/dotfiles
export GITHUB=~/github
export CONDA=/usr/local/miniconda3
export CUDA=/usr/local/cuda
export PATH=/usr/local/bin:$PATH
export PATH=/Library/TeX/texbin:$PATH
export PATH=$DOTFILES/bin:$PATH
export PATH=$CONDA/bin:$PATH
export PATH=$CUDA/bin:$PATH
export LD_LIBRARY_PATH=$CUDA/lib:$DYLD_LIBRARY_PATH
export CPATH=$CUDA/include:$CPATH
export CDPATH=".:$HOME:$DOTFILES:$GITHUB:$CDPATH"

# Aliases.
alias vi="$EDITOR"
alias vim="$EDITOR"
alias ls="ls -AFG"
alias sudo="sudo -E"
alias reload="exec zsh"
alias mkdir="mkdir -p"
alias grep=rg
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
alias py=python
alias shellcheck="shellcheck -x"

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

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

# Load pure prompt.
autoload -U promptinit; promptinit
prompt pure

# Completion.
zmodload zsh/complist
autoload -U compinit && compinit

zstyle ':completion:*' group-name ''
zstyle ':completion:*' format '%B---- %d%b'
zstyle ':completion:*' menu select
zstyle ':completion:*' verbose true
zstyle ':completion:*:warnings' format 'Too bad there is nothing'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Plugins.
source ~/.config/sh/z/z.sh
fpath=(/usr/local/share/zsh-completions $fpath)
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Automatically ls after cd.
chpwd() { ls }
