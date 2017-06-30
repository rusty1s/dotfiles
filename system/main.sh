#!/bin/sh

. ./helper/echos.sh
. ./helper/os.sh
. ./helper/package.sh

print_header System

package_update

package_install wget
package_install curl
if ! on_mac; then
  package_install zip
fi
package_install unzip
package_install ripgrep
package_install shellcheck
package_install ranger
