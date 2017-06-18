# Ansible Install Playbook

## Preinstall

Import GPG key or replace the encrypted files in the specific roles (`ssh`).

* **macOS**: `brew install gpg gpg-agent`
* `gpg --import private_key.key`
* `gpg --import public_key.key`
* `cd dotfiles && git-crypt unlock`

## Install

* `cd dotfiles/playbooks`
* `./launch`
