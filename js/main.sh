#!/bin/sh

. ./vars.sh

. ./helper/echos.sh
. ./helper/package.sh
. ./helper/cmd.sh
. ./helper/yarn.sh
. ./helper/symlink.sh

print_header JavaScript

package_install nodejs
package_install npm
package_install yarn

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
