#!/bin/sh

. ./helper/echos.sh
. ./helper/os.sh
. ./helper/package.sh

print_header "System"

package_update

package_install wget
package_install curl
package_install unzip
package_install ripgrep
package_install shellcheck
package_install ranger

if on_arch; then
  package_install zip
fi
