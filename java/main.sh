#!/bin/sh

. ./vars.sh

. ./helper/echos.sh
. ./helper/os.sh
. ./helper/package.sh
. ./helper/pacaur.sh
. ./helper/brew.sh

print_header Java

if on_arch; then
  package_install jdk8-openjdk
  eval_cmd "Set global java version" "sudo archlinux-java set java-8-openjdk"
  pacaur_install eclipse-java
fi
