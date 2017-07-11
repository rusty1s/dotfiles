#!/bin/sh

. ./helper/echos.sh
. ./helper/remove.sh
. ./helper/dir.sh
. ./helper/git.sh
. ./helper/symlink.sh

print_header Shell

remove "$HOME/.bashrc"
remove "$HOME/.bash_profile"
remove "$HOME/.bash_history"
remove "$HOME/.bash_logout"

make_dir "$HOME/.config/sh"
git_clone https://github.com/rupa/z "$HOME/.config/sh/z"
git_clone https://github.com/illinoisjackson/even-better-ls "$HOME/.config/sh/even-better-ls"

make_dir "$HOME/.config/zsh"
git_clone https://github.com/zsh-users/zsh-completions "$HOME/.config/zsh/completions"
git_clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.config/zsh/autosuggestions"
git_clone https://github.com/zsh-users/zsh-syntax-highlighting "$HOME/.config/zsh/syntax-highlighting"
git_clone https://github.com/zsh-users/zsh-history-substring-search "$HOME/.config/zsh/history-substring-search"

symlink "$HOME/dotfiles/shell/.zshrc" "$HOME/.zshrc"