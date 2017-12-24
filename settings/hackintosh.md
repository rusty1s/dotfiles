# Hackintosh

* [Guide to fresh installing macOS High Sierra on a Hackintohs](http://hackintosher.com/guides/high-sierra-install-full-guide/)
* [UniBeast: Install macOS High Sierra on Any Supportes Intel-based PC](https://www.tonymacx86.com/threads/unibeast-install-macos-high-sierra-on-any-supported-intel-based-pc.235474/)

MacOS needs an EFI-partition larger than 200 MB! [Tutorial](https://apple.stackexchange.com/questions/57597/how-to-fix-broken-efi-partition)

## z270 MSI

1. Download [OsxAptioFix2Drv-free2000.efi.zip](http://hackintosher.com/wp-content/uploads/2017/07/OsxAptioFix2Drv-free2000.efi_.zip) and paste it into `EFI/CLOVER/drivers64UEFI/`
1. `Advanced > USB Configuration > XHCI Hand-off` to `enabled`
1. `Advanced > USB Configuration > Legacy USB Support` to `auto`
1. `Advanced > Wake Up Event Setup > Resume By USB Device` to `enabled`
1. `Advanced > Wake Up Event Setup > From S3/S4/S5 by PS/2 Mouse` to `enabled`
1. `Advanced > Wake Up Event Setup > From S3/S4/S5 by PS/2 Mouse` to `any key`
1. `Overclocking > Extreme Memory Profile (X.M.P)` to `enabled`
1. `Overclocking > CPU Features > CFG-Lock` to `disabled`
