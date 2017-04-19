# Windows

## Cygwin

Fuer Symlinks muss das Terminal unbedingt immer als Adminstrator gestartet werden.
Dazu Rechtsklick auf das Terminal-Icon und:
1. Eigenschaften
1. Kompatibilität
1. "Programm als Adminstrator ausfuehren"

## ConsoleZ

1. Doubleclick `dotfiles/windows/console-Z-powerline.reg` to enable powerline symbols.

## Installation

1. `vagrant box update && vagrant up && vagrant ssh`
1. `sudo apt-get update`
1. `sudo apt-get install git`
1. `git clone https://github.com/rusty1s/dotfiles`
1. `./dotfiles/windows/install.sh`
