> ## ACPI Patching:

1. Download and install [MaciASL](https://github.com/acidanthera/MaciASL/releases) if you do not have it already.
2. Dump your original ACPI tables. There are a number of ways to do this, using Clover, Hackintool, Linux. See [here](https://khronokernel.github.io/Getting-Started-With-ACPI/Manual/dump.html).  
3. In Terminal, disassemble the copied ACPI tables with "iasl -dl DSDT.aml". For our purpose, the only file that really matters is DSDT.dsl

- Your DSDT file will be used as a reference table in determining that needs to be patched and what patches need to be added.

4. Source SSDT\*.dsl patch files are located in `patches` folder.
5. Refer to my `EFI-OpenCore` folder to see which patches are currently being used by me.
6. If your razer15's **model is late 2019 RZ09-0313x**, most of my compiled hotpatches and can likely be copied straight to your setup. However, some patches may require certain directories or variables to be changed depending on your hardware (examine your own disasemebled DSDT). For these, edit the .dsl patch files. Also, note that some SSDT patches also require accompanying OpenCore/ Clover ACPI patches to work.

A good way to see if you need to edit and compile your own SSDT patches is to compare your DSDT.dsl with mine of the same BIOS version. You can find my disasemebled DSDT file in `ACPI/Disassembled ACPI/BIOS-v*`.

Should your source DSDT be similar enough (in regards to certain items in these ACPI patches)to mine. Congrats! You can simply try my compiled patches. Should it differ however, please carefully examine these notes and create your own SSDT patches.  

7. Once you have the compiled ACPI patches, place them in `EFI/OC/ACPI/` and make sure to create matching entries within OpenCore's `config.plist`'s `ACPI/Add/` section.

# Hotpatching Notes

- Source ACPI patches are `.dsl` Edit these as needed.
- Compiled ACPI patches are `.aml` Once compiled, these belong to `EFI/OC/ACPI`.
- OpenCore Patches are patches for `config.plist` in their respective level.
- For ACPI path references, please check [ACPI-paths](https://github.com/tylernguyen/razer15-hackintosh/tree/master/docs/assets/img/ACPI-paths/)

## Some patches here may be unused. Refer to the current OpenCore-EFI folder to see which one I am currently using. While other patches may be needed case-by-case, such as the WiFi/Bluetooth patches.

## Some machines are `LPC` and some are`LPCB`. Please examine your own DSDT and modify patches as needed.

> ### Non-native WiFi and Bluetooth

`OpenCore Patches/ Config-DW1560.plist` for DW1560 model cards.  
`OpenCore Patches/ Config-DW1820A.plist` for WD1820A model cards.

\*Notice that these patches require additional kexts to be installed. See them in `Kernel/Add/`

> ### SSDT-BATT-razer15-late2019 - Enables Battery Status in macOS and Support for I2C

**Need `OpenCore Patches/ Razer15battery.plist`**  

> ### SSDT-PLUG-_SB.PR00 - Enables Native Intel Power Managements

Processor path is `_SB.PR00`  
Why?: `Processor` search in DSDT, rename `PR` to other variables as needed.

```
    Scope (\_PR)
    {
        Processor (PR00, 0x01, 0x00001810, 0x06){}
        Processor (PR01, 0x02, 0x00001810, 0x06){}
        Processor (PR02, 0x03, 0x00001810, 0x06){}
        Processor (PR03, 0x04, 0x00001810, 0x06){}
        Processor (PR04, 0x05, 0x00001810, 0x06){}
        Processor (PR05, 0x06, 0x00001810, 0x06){}
        Processor (PR06, 0x07, 0x00001810, 0x06){}
        Processor (PR07, 0x08, 0x00001810, 0x06){}
        Processor (PR08, 0x09, 0x00001810, 0x06){}
        Processor (PR09, 0x0A, 0x00001810, 0x06){}
        Processor (PR10, 0x0B, 0x00001810, 0x06){}
        Processor (PR11, 0x0C, 0x00001810, 0x06){}
        Processor (PR12, 0x0D, 0x00001810, 0x06){}
        Processor (PR13, 0x0E, 0x00001810, 0x06){}
        Processor (PR14, 0x0F, 0x00001810, 0x06){}
        Processor (PR15, 0x10, 0x00001810, 0x06){}
    }
```

> ### SSDT-PNLF-CFL - Enables Brightness Management in macOS

iGPU is `PCI0.GFX0`  
Why?: `Coffee Lake` CPU.  
Used in conjunction with `WhateverGreen.kext`

> ### SSDT-EC-USBX-LAPTOP - Create a fake embedded controller called `EC`

- Existing EC maybe incompatible with macOS, so a fake one is created.

> ### SSDT-OCGPI0-GPHD - Disable builtin TPD0 I2C device.

- In this step, our touchpad device called `TPD0` is disabled.

> ### SSDT-OCI2C-TPXX-RAZER15

- Move the contents of touchpad device `TPD0` to a fake device called `TPXX` for pinning purposes. `VoodooI2C` and `VoodooI2CHID` will attach to this device for a functional touchpad.

> ### SSDT-I2CxConf

- Support layer for `SSDT-OCI2C-TPXX-RAZER15`

> ### SSDT-dGPU-Off - Disable NVIDIA Discrete GPU

Why?: NVIDIA GPU is not supported in macOS as of Catalina. Disabling via an ACPI patch will save power vs using a boot-arg.

> ### SSDT-AWAC - Re-enable legacy RTC clock that is compatible with macOS
Why?: `AWAC` is found in DSDT when searching for `ACPI000E`.

> ### SSDT-SBUS-MCHC

Why?: `0x001F0004` under Device (SBUS).  
Why?: `MCHC` is missing in DSDT.

> ### SSDT-DMAC

- Compatibility device for macOS.  
Why?: `PNP0200` is missing in DSDT.

> ### SSDT-MEM2.dsl
- Compatibility device for macOS. 
Why?: `PNP0C01` is missing in DSDT.

> ### SSDT-PMCR

- Compatibility device for macOS.  
Why?: `PMCR`,`APP9876` missing in DSDT.

> ### SSDT-PPMC

- Compatibility device for macOS.  
Why?: `0x001F0002` missing in DSDT.

> ### SSDT-ALSD

Starting with Catalina, an ambient light sensor device is required for brightness preservation. The Razer 15 Late 2019 has a builtin light sensor.
Why?: `ACPI0008` found in DSDT.


```
Special thanks to [daliansky](https://github.com/daliansky).
```
