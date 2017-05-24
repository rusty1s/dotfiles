# VirtualBox Settings

1. `VirtualBox > Preferences > Input > Uncheck Auto Capture Keyboard`
1. `VirtualBox > Preferences > Display > Maximum Guest Screen Size > None`

## Configure Proxy (optional)

1. `VirtualBox > Preferences > Proxy`

## Configure VM

1. `Settings > System > Processor > 2 CPUs`

## Bugfix

In macOS `cmd+Q` and `cmd+H` still doesn't get passed to the Guest OS (a limitation by VirtualBox).
* Make VirtualBox VM accessable: `ln -sf /Applications/VirtualBox.app/Contents/Resources/VirtualBoxVM.app /Applications/VirtualBoxVM.app`
* Disable via [BetterTouchTool](https://www.boastr.net/): [Tutorial](http://stackoverflow.com/questions/15719135/how-to-disable-keyboard-shortcuts-in-mac-os-x)
