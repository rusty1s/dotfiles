#!/bin/sh

. ./vars.sh

. ./helper/echos.sh
. ./helper/os.sh
. ./helper/cmd.sh
. ./helper/package.sh
. ./helper/cmd.sh
. ./helper/apt.sh
. ./helper/yarn.sh
. ./helper/symlink.sh

print_header JavaScript

if ! on_ubuntu; then
  package_install nodejs
  package_install npm
  package_install yarn
else
  eval_cmd "nodejs prerequisites" "curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -"
  package_install nodejs

  eval_cmd "Add key" "curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -"
  eval_cmd "Set source" "echo deb https://dl.yarnpkg.com/debian/ stable main | sudo tee /etc/apt/sources.list.d/yarn.list"
  apt_update_sources
  package_install yarn
fi

eval_cmd "Set yarn global bin" "yarn config set prefix ~/.yarn-global"

yarn_update

yarn_install create-react-app
yarn_install eslint
yarn_install prettier
yarn_install eslint-plugin-prettier
yarn_install eslint-config-prettier
yarn_install markdownlint-cli

symlink "$DOTFILES/js/.eslintrc" "$HOME/.eslintrc"
symlink "$DOTFILES/js/.prettierrc" "$HOME/.prettierrc"
symlink "$DOTFILES/js/.tern-project" "$HOME/.tern-project"
