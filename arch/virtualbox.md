# VirtualBox Settings

* `Auto Capture Keycode` needs to be turned off! (Preferences > Input)
* In macOS `cmd+Q` and `cmd+H` still doesn't get passed to the Guest OS (a limitation by VirtualBox)
  * Make VirtualBox VM accessable: `ln -sf /Applications/VirtualBox.app/Contents/Resources/VirtualBoxVM.app /Applications/VirtualBoxVM.app`
  * Disable via [BetterTouchTool](https://www.boastr.net/): [Tutorial](http://stackoverflow.com/questions/15719135/how-to-disable-keyboard-shortcuts-in-mac-os-x)
