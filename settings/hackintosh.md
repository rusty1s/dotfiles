# Hackintosh

* [Guide to fresh installing macOS High Sierra on a Hackintohs](http://hackintosher.com/guides/high-sierra-install-full-guide/)
* [UniBeast: Install macOS High Sierra on Any Supportes Intel-based PC](https://www.tonymacx86.com/threads/unibeast-install-macos-high-sierra-on-any-supported-intel-based-pc.235474/)

## Information

* MacOS needs an EFI-partition larger than 200 MB! [Tutorial](https://apple.stackexchange.com/questions/57597/how-to-fix-broken-efi-partition)
* Fix Audio: [Link 1](http://hackintosher.com/guides/get-hackintosh-audio-working/#step3) and [Link 2](https://www.reddit.com/r/hackintosh/comments/766tsy/cant_install_audio_msi_z270_macos_sierra/)
* Sleep: Set `darkmode=8`

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

### MultiBeast

1. `Drivers > Audio > Realtek ALCxxx > ALC1220`
1. `Drivers > Disk > 3rd Party SATA`
1. `Drivers > Misc > FakeSMC`
1. `Drivers > Network > Intel > IntelMausiEthernet v2.3.0`
1. `Drivers > USB > Increase Max Port Limit 200 Series`
1. `Bootloaders > COLVER UEFI Boot Mode + Emulated NVRAM`
1. `Drivers > Graphics > NVIDIA Web Drivers Boot Flag`

## Cuda

* Download both Cuda 8 and Cudnn 6 manually
* You also need downgraded [Command Line Tools for Xcode 8.2](https://developer.apple.com/download) and remove `Library/Developer/CommandLineTools` first!
* Download XCode to be able to switch between CommandLineTools versions
