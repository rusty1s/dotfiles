# Dotfiles as ansible roles

## Preinstall

Import GPG key or replace the encrypted files in the specific roles (`ssh`).

* `./dotfiles/playbooks/bootstrap`
* `gpg --import private_key.key`
* `gpg --import public_key.key`
* `cd dotfiles && git-crypt unlock`

## Install

* `cd dotfiles/playbooks`
* `./launch`
