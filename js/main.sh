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
yarn_install prettier

symlink "$HOME/dotfiles/js/.tern-project" "$HOME/.tern-project"
