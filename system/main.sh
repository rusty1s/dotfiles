#!/bin/sh

. ./helper/echos.sh
. ./helper/os.sh
. ./helper/package.sh
. ./helper/pacaur.sh

print_header System

package_update

package_install wget
package_install curl
package_install unzip
package_install ripgrep
package_install shellcheck
package_install ranger

if ! on_mac; then
  package_install zip
fi

if on_mac; then
  package_install duti  # Set default applications for file types.
fi
