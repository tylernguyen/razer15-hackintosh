# Hardware:

> ## PM981:  
The stock drive for my specific model is a Lite-On NVMe, which is perfectly compatible. However, for installation on the drive `PM981` (which comes on some models), please refer to [Issue #43](https://github.com/tylernguyen/x1c6-hackintosh/issues/43). That is an issue on my [x1c6-hackintosh](https://github.com/tylernguyen/x1c6-hackintosh) project, though the installation specifics should still apply.  

> ## WiFi and Bluetooth:

* Replace factory Intel WiFi module with a macOS compatible one. Make sure that the card is of M.2 form factor. I replaced it with the BCM94360CS2 card. This works out of the box without additional kexts and has been stable for me thus far.
* For the BCM94360CS2 to work with the razer15, you would also need a M.2 NGFF adapter. They run for <\$10 on eBay under "BCM94360CS2 m2 adapter"

However, there exists other alternatives with better WiFi and Bluetooth standards, but additional kexts and patches are required. See [`dortania/Wireless-Buyers-Guide`](https://dortania.github.io/Wireless-Buyers-Guide/).  

> ## Dedicated NVIDIA GPU:

As of Catalina, macOS does not support NVIDIA graphics. So the GPU will disabled via an ACPI patch to save power and prevent conflicts. Refer to [docs/5_README-ACPIpatching.md](https://github.com/tylernguyen/razer15-hackintosh/blob/master/docs/5_README-ACPIpatching.md) for specifics of the patch.