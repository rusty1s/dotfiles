# Dotfiles as ansible roles

## Preinstall

Import GPG key or replace the encrypted files in the specific roles (`ssh`).

* `cd dotfiles`
* `./playbooks/bootstrap`
* `gpg --import private_key.key`
* `gpg --import public_key.key`
* `git-crypt unlock`

## Install

* `cd playbooks`
* `./launch`
