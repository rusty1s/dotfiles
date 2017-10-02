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
elif on_ubuntu; then
  package_install openjdk-8-jre
  package_install openjdk-8-jdk
  package_install openjdk-8-doc
  package_install openjdk-8-source
  package_install eclipse
elif on_mac; then
  brew_cask_install java
  brew_cask_install eclipse-java
fi
