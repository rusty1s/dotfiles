#!/bin/sh

. ./vars.sh

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

symlink "$DOTFILES/tmux/.tmux.conf" "$HOME/.tmux.conf"

gem_install tmuxinator

remove "$HOME/.tmuxinator"
symlink "$DOTFILES/tmux/.tmuxinator" "$HOME/.tmuxinator"
