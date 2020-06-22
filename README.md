# macOS on Razer Blade 15 Late 2019, Model RZ09-0313*

[![macOS](https://img.shields.io/badge/macOS-Catalina-yellow.svg)](https://github.com/996icu/996.ICU/blob/master/LICENSE)
[![version](https://img.shields.io/badge/10.15.5-yellow)](https://github.com/996icu/996.ICU/blob/master/LICENSE)
[![BIOS](https://img.shields.io/badge/BIOS-1.03-blue)](https://github.com/996icu/996.ICU/blob/master/LICENSE)
[![MODEL](https://img.shields.io/badge/Model-RZ09_0313*-blue)](https://github.com/996icu/996.ICU/blob/master/LICENSE)
[![OpenCore](https://img.shields.io/badge/OpenCore-0.5.9-green)](https://github.com/996icu/996.ICU/blob/master/LICENSE)
[![LICENSE](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/996icu/996.ICU/blob/master/LICENSE)

<img align="right" src="https://raw.githubusercontent.com/tylernguyen/razer15-hackintosh/master/docs/assets/img/razer15.png" alt="Critter" width="300">

### Check out my blog [tylerspaper.com](https://tylerspaper.com/)

#### READ THE ENTIRE README.MD BEFORE YOU START.

#### I am not responsible for any damages you may cause.

### Should you find an error, or improve anything, be it in the config itself or in the my documentation, please consider opening an issue or a pull request to contribute.

`I AM A ONE MAN TEAM, AND A FULL TIME STUDENT. SO, I MIGHT NOT BE ABLE TO RESPOND OR HELP YOU IN A TIMELY MANNER. BUT, I PROMISE I WILL GET TO YOU EVENTUALLY. PLEASE UNDERSTAND.`

`Lastly, if my work here helped you. Please consider donating, it would mean a lot to me.`

> ## Update

##### Recent | [Changelog Archive](https://github.com/tylernguyen/razer15-hackintosh/blob/master/docs/CHANGELOG.md)

> ### 2020-6-21

#### Added

- Initial project commit. Please review documentations for features and issues.

> ## SUMMARY:

**`In short, if you're looking for a dual-boot OS for productivity on the Razer 15, this repo is very stable and is perfect for you. I fully recommend this project.`**

| Fully functional                                                                                                                                                    | Non-functional                                                           | Semi-functional. Additional pulls needed and welcomed. |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------ | ------------------------------------------------------ |
| WiFi, Bluetooth, Apple Continuity ✅ \*need [network card replacement](https://github.com/tylernguyen/razer15-hackintosh/blob/master/docs/1_README-HARDWARE.md) | NVIDIA GPU (DISABLED using ACPI patch) ❌                                |                                                        |
| USB A, USB C, Webcam, Audio Playback/Recording Sleep, Intel Graphics, Touchpad ✅                                                                                   | HDMI and DisplayPort (Tied to NVIDIA GPU)❌ See [NVIDIA Control Panel](https://github.com/tylernguyen/razer15-hackintosh/blob/master/docs/assets/img/nvidia-control-panel.png) |                                                        |
| iCloud suite: App Store, iMessage, FaceTime, iCloud Drive, etc... ✅                                                                                                | Hibernation ❌                                                           |                                                       |
| Multimedia Fn keys ✅                                                                                                                                               |                                                                          |                                                        |
|                                                                                                                                                                     |                                                                          |                                                        |

**For more information regarding certain features, please refer to [`docs/4_README-POSTinstallation.md`](https://github.com/tylernguyen/razer15-hackintosh/blob/master/docs/4_README-POSTinstallation.md)**

> ## NEEDED:

A macOS machine would be VERY useful: to create install drives, and for when your ThinkPad cannot boot. Though it is not completely necessary.  
Flash drive, 12GB or more.  
`AfuWin64` and `AMIBCP64` to mod BIOS, both of which have been archived by me under `/tools`.  
Xcode works fine for editing plist files, but I prefer [PlistEdit Pro](https://www.fatcatsoftware.com/plisteditpro/).  
[ProperTree](https://github.com/corpnewt/ProperTree) if you need to edit plist files on Windows.  
[MaciASL](https://github.com/acidanthera/MaciASL), for patching ACPI tables.  
[MountEFI](https://github.com/corpnewt/MountEFI) to quickly mount EFI partitions.  
[IOJones](https://github.com/acidanthera/IOJones), for diagnosis.  
[Hackintool](https://www.insanelymac.com/forum/topic/335018-hackintool-v286/), for diagnostic ONLY, Hackintool should not be used for patching, it is outdated.

> ## WHERE TO START:

Explore links included this README, especially those in references and other razer15-hackintosh repos.

Once you are ready, follow the series of README files included `docs/`.  
[**1_README-HARDWARE**](https://github.com/tylernguyen/razer15-hackintosh/blob/master/docs/1_README-HARDWARE.md): Hardware notes before starting.  
[**2_README-BIOS-mod-and-settings**](https://github.com/tylernguyen/razer15-hackintosh/blob/master/docs/2_README-BIOS-mod-and-settings.md): Hardware notes before starting.  
[**3_README-install**](https://github.com/tylernguyen/razer15-hackintosh/blob/master/docs/3_README-install.md): Creating the macOS install drive.  
[**4_README-POSTinstallation**](https://github.com/tylernguyen/razer15-hackintosh/blob/master/docs/4_README-POSTinstallation.md): Settings and tweaks post installation.  
[**5_README-ACPIpatching**](https://github.com/tylernguyen/razer15-hackintosh/blob/master/docs/5_README-ACPIpatching.md): The hardest and most time consuming part, patching the system ACPI table for battery status, brightness, sleep, thunderbolt, thunderbolt hotplugging, etc...  
[**6_README-other.md**](https://github.com/tylernguyen/razer15-hackintosh/blob/master/docs/6_README-other.md): for other notices

- While you can plug-and-play most of my hotpatches across different Razer Blade 15 generations, I suggest that you dump and examine your own DSDT. This is important as your DSDT maybe different from mine. Some patches needed on my model is may not be needed on yours, or vice versa. And furthermore, you get to learn more about what's actually going on.

> ## MY SPECIFICATIONS:

Refer to [BLADE15ADVANCED-00000587-en](https://github.com/tylernguyen/razer15-hackintosh/blob/master/docs/references/BLADE15ADVANCED-00000587-en.pdf) an overview of my Razer 15 Late 2019 hardware.

| Processor Number                                                                                                                    | # of Cores | # of Threads | Base Frequency | Max Turbo Frequency | Cache | Memory Types | Graphics      |
| :---------------------------------------------------------------------------------------------------------------------------------- | :--------- | :----------- | :------------- | :------------------ | :---- | :----------- | :------------ |
| [i7-9750H](https://ark.intel.com/content/www/us/en/ark/products/191045/intel-core-i7-9750h-processor-12m-cache-up-to-4-50-ghz.html) | 6          | 12           | 2.6 GHz        | 4.5 GHz             | 12 MB | LPDDR3-2133  | Intel UHD 630 |

**Peripherals:**

```
One Thunderbolt 3 Type C Port (Right)
HDMI 2.0b
Mini DisplayPort 1.4
Lock Slot
One Type C Port (Left)
Two Type A Ports (Left & Right)
TrackPad: ELAN0406
```

**Display:**  
`15.6" *LG156M* 240Hz SDR Display (1920x1080)`  
**Audio:**  
`ALC298 Audio Codec`  
**Thunderbolt:**  
`Intel JHL7540 (Titan Ridge 2C 2018) Thunderbolt 3 Bridge`

> ## Read These (References):

- [dortania's Hackintosh guides](https://github.com/dortania)
- [dortania/ Getting Started with ACPI](https://dortania.github.io/Getting-Started-With-ACPI/)
- [dortania/ vanilla laptop guide](https://dortania.github.io/vanilla-laptop-guide/)
- [dortania/ opencore `laptop` guide](https://dortania.github.io/oc-laptop-guide/)
- [dortania/ opencore `desktop` guide](https://dortania.github.io/OpenCore-Desktop-Guide/)
- [dortania/ opencore `multiboot`](https://github.com/dortania/OpenCore-Multiboot)
- [dortania/ `USB map` guide](https://github.com/dortania/USB-Map-Guide)
- Daliansky's [Hackintool tutorial](https://translate.google.com/translate?js=n&sl=auto&tl=en&u=https://blog.daliansky.net/Intel-FB-Patcher-tutorial-and-insertion-pose.html).
- [WhateverGreen Intel HD Manual](https://github.com/acidanthera/WhateverGreen/blob/master/Manual/FAQ.IntelHD.en.md)

> ## OTHER razer15-hackintosh REPOSITORIES:

- [stonevil/Razer_Blade_Advanced_early_2019_Hackintosh](https://github.com/stonevil/Razer_Blade_Advanced_early_2019_Hackintosh)
- [Errrneist/Hackintosh-Razer-Blade-Advanced](https://github.com/Errrneist/Hackintosh-Razer-Blade-Advanced)
- [red-green/razer_blade_stealth_hackintosh](https://github.com/red-green/razer_blade_stealth_hackintosh)
- [blade15basehackintosh/razerbladehackintosh](https://github.com/blade15basehackintosh/razerbladehackintosh)  
  Create a pull request if you like to be added, final decision at my discreation.

> ## CONTACT:

https://tylerspaper.com/contact  
Signal: +1 (202)-644-9951 \*This is a Signal ONLY number. You will not get a reply of you text me at this number.

> ## DONATE AND SUPPORT:

https://tylerspaper.com/support/

> ## Credits and Thank You:

[@Colton-Ko](https://github.com/Colton-Ko/macOS-ThinkPad-X1C6) for the great features template.  
[@stevezhengshiqi](https://github.com/stevezhengshiqi) for the one-key-cpufriend script.  
[@corpnewt](https://github.com/corpnewt) for CPUFriendFriend.  
[@Sniki](https://github.com/Sniki) and [@goodwin](https://github.com/goodwin) for ALCPlugFix.  
[@xzhih](https://github.com/xzhih) for one-key-hidpi.  
[@daliansky](https://github.com/daliansky) for all the hotpatches.

The greatest thank you and appreciation to [@Acidanthera](https://github.com/acidanthera), without whom's work, none of this would be possible.

And to everyone else who supports and uses my project.

Please let me know if I missed you.
