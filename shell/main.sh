#!/bin/sh

. ./vars.sh

. ./helper/echos.sh
. ./helper/os.sh
. ./helper/package.sh
. ./helper/cmd.sh
. ./helper/remove.sh
. ./helper/dir.sh
. ./helper/git.sh
. ./helper/yarn.sh
. ./helper/symlink.sh


print_header Shell

package_install zsh
package_install zsh-completions

remove "$HOME/.bashrc"
remove "$HOME/.bash_history"
remove "$HOME/.bash_logout"

make_dir "$HOME/.config/sh"
git_clone https://github.com/rupa/z "$HOME/.config/sh/z"

if ! on_mac; then
  git_clone https://github.com/illinoisjackson/even-better-ls "$HOME/.config/sh/even-better-ls"
  eval_cmd "Install even-better-ls" "cd $HOME && sh $HOME/.config/sh/even-better-ls/install.sh"
fi

make_dir "$HOME/.config/zsh"
git_clone https://github.com/zsh-users/zsh-completions "$HOME/.config/zsh/completions"
git_clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.config/zsh/autosuggestions"
git_clone https://github.com/zsh-users/zsh-syntax-highlighting "$HOME/.config/zsh/syntax-highlighting"
git_clone https://github.com/zsh-users/zsh-history-substring-search "$HOME/.config/zsh/history-substring-search"

yarn_install pure-prompt

symlink "$DOTFILES/shell/.zshrc" "$HOME/.zshrc"
