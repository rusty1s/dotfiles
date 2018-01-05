# Hackintosh

* [Video Tutorial](https://www.youtube.com/watch?v=12BvDIMAy6Y&feature=youtu.be)
* [Guide to fresh installing macOS High Sierra on a Hackintohs](http://hackintosher.com/guides/high-sierra-install-full-guide/)
* [UniBeast: Install macOS High Sierra on Any Supportes Intel-based PC](https://www.tonymacx86.com/threads/unibeast-install-macos-high-sierra-on-any-supported-intel-based-pc.235474/)

## Information

* MacOS needs an EFI-partition larger than 200 MB! [Tutorial](https://apple.stackexchange.com/questions/57597/how-to-fix-broken-efi-partition)

## Clover

* Boot:
   * Set `darkwake=8` to enable sleep
   * Uncheck `Debug` to enable fast boot, set `Timeout=5`
* Gui:
   * Uncheck `Legacy`
   * Add `Preboot` and `Recovery` entry under `Hide Volumes`

## Cuda

* Download and install both Cuda 8 and Cudnn 6 manually
* Download and install newest XCode from the AppStore and [XCode 8.2](https://developer.apple.com/download/more) to be able to [switch between CommandLineTools versions](https://stackoverflow.com/questions/47898851/how-to-install-nvidia-cudnn-v7-for-cuda-9-1-for-tensorflow-on-os-x-high-sierra-1) (`Preferences > Locations`)
* Download and install additional [Command Line Tools for Xcode 8.2](https://developer.apple.com/download/more)
* Switch whenever something needs to be build by `nvcc`

## z270 MSI

* [MSI z270 Gaming Pro Carbon ATX Hackintosh Build Guide](http://hackintosher.com/builds/msi-z270-gaming-pro-carbon-atx-hackintosh-build-guide/)
* [MSI z270 Gaming Pro Carbon](https://www.tonymacx86.com/threads/success-msi-z270-gaming-pro-carbon-intel-core-i7-7700k-corsair-rgb-16gb-ram-geforce-gtx-1080.228994/)

* Download [OsxAptioFix2Drv-free2000.efi.zip](http://hackintosher.com/wp-content/uploads/2017/07/OsxAptioFix2Drv-free2000.efi_.zip) and paste it into `EFI/CLOVER/drivers64UEFI/`

### BIOS

1. `Advanced > USB Configuration > XHCI Hand-off` to `enabled`
1. `Advanced > USB Configuration > Legacy USB Support` to `auto`
1. `Advanced > Wake Up Event Setup > Resume By USB Device` to `enabled`
1. `Advanced > Wake Up Event Setup > From S3/S4/S5 by PS/2 Mouse` to `enabled`
1. `Advanced > Wake Up Event Setup > From S3/S4/S5 by PS/2 Mouse` to `any key`
1. `Overclocking > Extreme Memory Profile (X.M.P)` to `enabled`
1. `Overclocking > CPU Features > CFG-Lock` to `disabled`
