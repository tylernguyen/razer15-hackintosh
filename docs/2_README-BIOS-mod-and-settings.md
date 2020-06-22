# BIOS modding and settings:

By default, the Razer 15 comes with a restricted BIOS and default options that does not play well with macOS. Flashing a modded BIOS will allow us to disable and change of these settings and will open up additional settings for undervolting/overclocking from the BIOS.

However, you should not that I am not responsible for any damages you may cause in flashing a custom firmware. These instructions here should be taken with a grain of salt, please do research on your specific machine and model.  

```
Both my stock and modded BIOS rom are archived under patches/BIOS_bkp for your REFERENCING. 
You should never flash another machine's BIOS file.
```

> ## Modding:  
You will need `AfuWin64` and `AMIBCP64` which have been archived by me under `/tools`.  
* I do not own these software so they may get taken down at any moment. Archive them yourself.  
* These softwares archived by me may not be the latest version. They have been verified to work on my machine. However, they may not work on yours and may even result in permanent damage. Please do your own DuckDuckGoing.
* Additional, these settings were first written by [@stoneevil](https://github.com/stonevil). Though there are some modifications made by me. 

Most of the options are required for further undervolting and overclocking. But, some of them are necessary for the macOS. These options are marked with **!**

* Open ``Tools\AMI\AMIBCP64\`` folder.
* Run ``AMIBCP64.exe`` application.
* In ``AMIBCP`` application click ``Open``, navigate to ``Desktop`` and open BIOS saved in previous steps.
* In ``AMIBCP`` application
	* Unfold root folder in the left pane. This folder is blank and have no name.
	* Unfold ``Setup`` subfolder.
	* Click ``Power & Performance`` subfolder.
		* In the right pane, change ``Access/Use`` from ``Default`` to ``USER`` for
			* ``Power & Performance`` (second row from top)
			* ``CPU - Power Management Control`` **!**
			* ``Intel(R) Speed Shift Technology``

![Power_Performance](https://github.com/stonevil/Razer_Blade_Advanced_early_2019_Hackintosh/raw/master/images/Power_Performance.png)

* Unfold ``CPU VR Settings``
* Click `` View/Configure CPU Lock Configuration`` folder in the left pane
* In right the pane, change ``Access/Use`` from ``Default`` to ``USER`` for
	* ``CFG Lock``
	* ``Overclocking Lock``

![CPU_VR_Settings](https://github.com/stonevil/Razer_Blade_Advanced_early_2019_Hackintosh/raw/master/images/CPU_VR_Settings.png)

* Click ``CPU - Power Management Control`` folder in the left pane
	* In the right pane, change ``Access/Use`` from ``Default`` to ``USER`` for
		* ``CPU - Power Management Control`` (second row from top) **!**
		* ``Intel(R) SpeedStep(tm)``
		* ``Intel(R) Speed Shift Technology``
		* ``C states``
		* ``Package C State Limit``
		* ``CPU Lock Configuration`` (scroll way down) **!**

![CPU_Power_Management_Control1](https://github.com/stonevil/Razer_Blade_Advanced_early_2019_Hackintosh/raw/master/images/CPU_Power_Management_Control1.png)

![CPU_Power_Management_Control2](https://github.com/stonevil/Razer_Blade_Advanced_early_2019_Hackintosh/raw/master/images/CPU_Power_Management_Control2.png)

* Click ``OverClocking Performance Menu`` folder in the left pane
	* In the right pane, change ``Access/Use`` from ``Default`` to ``USER`` for
		* ``OverClocking Performance Menu`` (second row from top)
		* ``XTU Interface``
		*	``Processor``
		* ``Ring``
		* ``GT``
		* ``Uncore``
		* ``Memory``

![OverClocking_Performance_Menu](https://github.com/stonevil/Razer_Blade_Advanced_early_2019_Hackintosh/raw/master/images/OverClocking_Performance_Menu.png)

* Unfold ``OverClocking Performance Menu`` subfolder.
* Click ``Processor`` folder in the left pane
	* In the right pane, change ``Access/Use`` from ``Default`` to ``USER`` for
		* ``Processor`` (second row from top)
		* ``Core Voltage Offset``
		* ``Offset Prefix`` below ``Core Voltage Offset``

![Processor](https://github.com/stonevil/Razer_Blade_Advanced_early_2019_Hackintosh/raw/master/images/Processor.png)

* Click ``Ring`` folder in the left pane
	* In the right pane, change ``Access/Use`` from ``Default`` to ``USER`` for
		* ``Ring`` (second row from top)
		* ``Ring Max OC Radio``
		* ``Ring Down Bin``
		* ``Min Ring Ratio Limit``
		* ``Max Ring Ratio Limit``

![Ring](https://github.com/stonevil/Razer_Blade_Advanced_early_2019_Hackintosh/raw/master/images/Ring.png)

* Click ``GT`` folder in the left pane
	* In the right pane, change ``Access/Use`` from ``Default`` to ``USER`` for
		* ``GT Domain`` (second row from top)
		* ``GT Voltage Offset``
		* ``Offset Prefix`` below ``GT Voltage Offset``
		* ``GTU Voltage Offset``
		* ``Offset Prefix`` below ``GTU Voltage Offset``

![GT](https://github.com/stonevil/Razer_Blade_Advanced_early_2019_Hackintosh/raw/master/images/GT.png)

* Click ``Uncore`` folder in the left pane
	* In the right pane, change ``Access/Use`` from ``Default`` to ``USER`` for
		* ``Uncore`` (second row from top)
		* ``Uncore Voltage Offset``
		* ``Offset Prefix`` below ``Uncore Voltage Offset``

![Uncore](https://github.com/stonevil/Razer_Blade_Advanced_early_2019_Hackintosh/raw/master/images/Uncore.png)

* Click ``Memory Overclocking Menu`` folder in the left pane
	* In the right pane, change ``Access/Use`` from ``Default`` to ``USER`` for
		* ``Memory Profile`` (second row from top) **RAM XMP Profile**
		* ``Memory Profile`` (another one somewhere in the middle of the list) **RAM XMP profile**
		* ``Memory Reference Clock`` **RAM XMP Profile**
		* ``Memory Ratio`` **RAM XMP Profile**
		* ``Memory Voltage`` **RAM XMP Profile**

![Memory_Overclocking_Menu1](https://github.com/stonevil/Razer_Blade_Advanced_early_2019_Hackintosh/raw/master/images/Memory_Overclocking_Menu1.png)

![Memory_Overclocking_Menu2](https://github.com/stonevil/Razer_Blade_Advanced_early_2019_Hackintosh/raw/master/images/Memory_Overclocking_Menu2.png)

* Click ``Chipset`` folder in the left pane
	* In the right pane, change ``Access/Use`` from ``Default`` to ``USER`` for
		* ``System Agent (SA) Configuration`` (second row from top) **!**

![Chipset](https://github.com/stonevil/Razer_Blade_Advanced_early_2019_Hackintosh/raw/master/images/Chipset.png)

* Unfold ``Chipset`` subfolder.
* Click ``System Agent (SA) Configuration`` folder in the left pane
	* In the right pane, change ``Access/Use`` from ``Default`` to ``USER`` for
		* ``System Agent (SA) Configuration`` (second row from top) **!**
		* ``VT-d`` **!**
		* ``Graphics Configuration`` **!**
		* ``PEG Port Configuration``
		* ``VT-d`` (another one somewhere in the middle of the list) **!**

![System_Agent_Configuration](https://github.com/stonevil/Razer_Blade_Advanced_early_2019_Hackintosh/raw/master/images/System_Agent_Configuration.png)

* Unfold ``System Agent (SA) Configuration`` folder in the left pane
* Click ``Graphics Configuration`` folder in the left pane
	* In the right pane, change ``Access/Use`` from ``Default`` to ``USER`` for
		* ``Graphics Configuration`` (second row from top) **!**
		* ``Primary Display``
		* ``Internal Graphics``
		* ``DVMT Pre-Allocated`` **!**
		* ``DVMT Total Gfx Mem`` **!**

![Graphics_Configuration](https://github.com/stonevil/Razer_Blade_Advanced_early_2019_Hackintosh/raw/master/images/Graphics_Configuration.png)

* Click ``PEG Port Configuration`` folder in the left pane
	* In the right pane, change ``Access/Use`` from ``Default`` to ``USER`` for
		* ``PEG Port Configuration`` (second row from top)
		* ``ASPM``
		* ``ASPM L0s``

![PEG_Port_Configuration](https://github.com/stonevil/Razer_Blade_Advanced_early_2019_Hackintosh/raw/master/images/PEG_Port_Configuration.png)

* Click ``Save As`` in ``AMIBCP`` application.
* Save BIOS with new name to ``Desktop`` folder.
* Close ``AMIBCP`` application.


### BIOS flashing

* Open ``Tools\AMI\AfuWin64\`` folder.
* Run ``AFUWINGUIx64.EXE`` application.
* In ``AFUWINGUI`` application click ``Open`` button.
* Choose new modded BIOS from ``Desktop`` folder.
* Close all application except ``AFUWINGUI``. Close also all Windows TaskBar apps like Nvidia Expierence, Razer, etc.
* Click ``Flash`` button in ``AFUWINGUI`` application and confirm flashing BIOS.

![AFUWINGUI_Flash](https://github.com/stonevil/Razer_Blade_Advanced_early_2019_Hackintosh/raw/master/images/AFUWINGUI_Flash.png)

* Follow ``AFUWINGUI`` application on-screen instruction.
* Close ``AFUWINGUI`` application.
* Reboot Windows.

> ## Settings:  
There are a few changes in the BIOS that are vital to make macOS happy and bootable on RBA. Undervolting and Overclocking are explained in the following chapter.

* Reboot computer.
* Repeatedly press ``DEL`` key to enter BIOS configuration menu.
* In BIOS navigate to menu
	* ``Advanced``
		* ``Power & Performance``
			* ``CPU - Power Management Control``
				* ``CPU Lock Configuration``
					* Disable ``CFG Lock``
					* Disable ``Overclocking Lock``
	* ``Advanced``
		* ``Overclocking Performance Menu``
			* Disable ``XTU Interface``
	* ``Advanced``
		* ``Thunderbolt(TM) Configuration``
			* Switch ``Security Level`` to ``No Security``
	* ``Chipset``
		* ``System Agent (SA) Configuration``
			* ``Graphics Configuration``
				* Set ``DVMT Pre-Allocated`` to ``64``
				* Set ``DVMT Total Gfx Mem`` to ``MAX``
	* ``Chipset``
		* ``System Agent (SA) Configuration``
			* Disable ``VT-d``
	* ``Chipset``
		* ``SATA And RST Configuration``
			* Check ``SATA Mode Selection`` set to ``AHCI``
	* ``Security``
		* Set ``Secure Boot`` to ``Disabled``
	* ``Boot``
		* Set ``Fast Boot`` to ``Disabled``
		* ``CSM Configuration``
			* Set ``CSM Support`` to ``Disabled``
	* ``Save and Exit``
		* Hit ``Save Changes``
		* Hit ``Save Changes and Reset``


**Note: If some of these options are not available in BIOS, please, boot back in Windows and check modded BIOS dump for missing changes.**

---
**Once again, credit to [@stonevil](https://github.com/stonevil) for first writing these instructions.**