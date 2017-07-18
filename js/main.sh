#!/bin/sh

. ./helper/echos.sh
. ./helper/package.sh
. ./helper/yarn.sh
. ./helper/symlink.sh

print_header JavaScript

package_install nodejs
package_install npm
package_install yarn

yarn_update

yarn_install create-react-app
yarn_install eslint
yarn_install prettier
yarn_install eslint-plugin-prettier
yarn_install eslint-config-prettier
yarn_install markdownlint-cli

symlink "$HOME/dotfiles/js/.eslintrc" "$HOME/.eslintrc"
symlink "$HOME/dotfiles/js/.prettierrc" "$HOME/.prettierrc"
symlink "$HOME/dotfiles/js/.tern-project" "$HOME/.tern-project"
