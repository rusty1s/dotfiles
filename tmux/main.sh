#!/bin/sh

. ./helper/echos.sh
. ./helper/os.sh
. ./helper/package.sh
. ./helper/ruby.sh
. ./helper/remove.sh
. ./helper/symlink.sh

print_header Tmux

package_install tmux

if on_mac; then
  package_install reattach-to-user-namespace
fi

symlink "$HOME/dotfiles/tmux/.tmux.conf" "$HOME/.tmux.conf"

gem_install tmuxinator

remove "$HOME/.tmuxinator"
symlink "$HOME/dotfiles/tmux/.tmuxinator" "$HOME/.tmuxinator"
