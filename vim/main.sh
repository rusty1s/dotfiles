#!/bin/sh

. ./vars.sh

. ./helper/echos.sh
. ./helper/os.sh
. ./helper/brew.sh
. ./helper/package.sh
. ./helper/python.sh
. ./helper/dir.sh
. ./helper/symlink.sh
. ./helper/remove.sh

print_header Vim

if on_mac; then
  brew_tap neovim/neovim
fi

package_install neovim

if on_arch; then
  package_install python2-neovim
  package_install python-neovim
fi

system_pip_install neovim

python_virtualenv_activate "$PYTHON_VENV/$PYTHON_VENV_VERSION"

pip_install neovim

make_dir "$HOME/.config/nvim"
symlink "$DOTFILES/vim/init.vim" "$HOME/.config/nvim/init.vim"
remove "$HOME/.config/nvim/after"
symlink "$DOTFILES/vim/after" "$HOME/.config/nvim/after"
