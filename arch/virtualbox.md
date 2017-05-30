# VirtualBox Settings

1. `VirtualBox > Preferences > Input > Uncheck Auto Capture Keyboard`
1. `VirtualBox > Preferences > Display > Maximum Guest Screen Size > None`

## Configure Proxy (optional)

1. `VirtualBox > Preferences > Proxy`

## Configure VM

1. `Settings > System > Processor > 2 CPUs`
1. `Settings > General > Advanced > Shared Clipboard: Bidirectional`
1. Right click Statusbar and hide

## Bugfix

In macOS `Cmd+Q` and `Cmd+H` still doesn't get passed to the Guest OS (a limitation by VirtualBox).
Until VirtualBox fixes the issue, we can use **Karabiner**, swap the `Alt` and `Cmd` key and use `Alt` as our i3 modifier.

1. Make VirtualBoxVM accessable: `ln -sf /Applications/VirtualBox.app/Contents/Resources/VirtualBoxVM.app /Applications/VirtualBoxVM.app`
1. Download Karabiner: `brew cask install karabiner`
1. `ln -sf ~/dotfiles/arch/private.xml ~/Library/Application\ Support/Karabiner/private.xml`
1. Click `Reload XML` and check `Swap Alt to Cmd in VirtualBoxVM`
