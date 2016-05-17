# Gamestarter v2
![Gamestarter-logo](https://raw.githubusercontent.com/bite-your-idols/script.gamestarter/master/resources/media/gamestarter-logo.jpg)

English/[Spanish](https://github.com/bite-your-idols/gamestarter-openelec/blob/master/README-ES.md)

Follow me on [twitter](https://twitter.com/bite_your_idols)

## Retrogamig addon for Raspberry Pi's Kodi.

If you use a Raspberry Pi as a media center running Kodi on [LibreELEC](https://libreelec.tv/) or [OpenELEC](http://openelec.tv/), you like retrogaming and you want to launch games just as you do with movies and tv shows without dual-booting, swaping SD memories, complex installations... Here you have the definitve solution.

With this addon you will continue with your own customized Kodi but empowered including: 
- Retroarch multi-emulator frontend (updated to v1.3.4) with a launcher addon and joypad configs,
- AdvancedLauncher addon with default emulator list and a custom skin,
- Emulationstation frontend,
- Amiga UAE4ARM emulator included in AdvancedLauncher and Emulationstation frontend,
- Some test freeware roms.

Also, you will have the choice of one-click installation of:
- Internet Archive ROM Launcher addon to launch games from the "cloud",
- 3 GameMaker Pi ports including modern masterpiece "Maldita Castilla".

So, let's go!!


## Installation Instructions
Download the latest release of the addon from [Release Page](), copy into your Raspberry Pi and select "install from zip" in Settings>Addons menu. The first time the addon is launched it will perform some settings. Then copy your [roms and bios](https://github.com/libretro/Lakka/wiki/ROMs-and-BIOSes) to /storage/emulators/ folder via ftp or [samba](http://wiki.openelec.tv/index.php/Accessing_Samba_Shares) and reboot.

![gamestarter-addon](https://raw.githubusercontent.com/bite-your-idols/script.gamestarter/master/resources/media/screenshot000.png)

>Before installation I recommend to backup your system or create an image of your SD card using [USB Image Tool](http://www.alexpage.de/usb-image-tool/).

>The addon has ben tested into OpenELEC 6, OpeneELEC 7 beta and LibreELEC 7 in a Raspberry Pi 2/3 model B and everything is working ok. I also recommend to read this whole text before installation to understand what is this all about.

.


##### Pre-Installed image 
You can download and write [this pre-installed image](https://goo.gl/l9X3rC) with OpenELEC into your SD card using [USB Image Tool](http://www.alexpage.de/usb-image-tool/). It includes some extras like custom splash screen and addon shortcuts on home page.

>After image boot you can expand your OpenELEC storage following [this workaround](forum.kodi.tv/showthread.php?tid=230353&pid=2166080#pid2166080).

This is based on an old Gamestarter and OpenenELEC version and I am not going to update any more, addon installation is so easy and if you want a kodi prebuild image with retrogaming setup there are other alternatives.

.



## Post-installation setup

#### RetroArch:

After installation is completed there are several ways of launching RetroArch. The easiest one is using the addon that is located under Program Addons called Gamestarter: Retroarch. 

![screenshot-addons](https://github.com/bite-your-idols/gamestarter-openelec/raw/master/assets/screenshot-addons.png)

The first time RetroArch is launched I recommend to update everything (Settings menu> Online Updater). Then you can create your own playlists, start games, change cores, user dynamic wallpapers, boxarts, update cores... just like in [Lakka](http://www.lakka.tv/) distro!!

![screenshot-retroarch-](https://github.com/bite-your-idols/gamestarter-openelec/raw/master/assets/screenshot-retroarch.gif)


***
###### Tip:
Instead os using this addon you can [remap your remote](http://kodi.wiki/view/HOW-TO:Modify_keymaps) and assign to a key the following action:
```
XBMC.System.Exec("/storage/emulators/scripts/gamestarter.sh retroarch")
```
***

.

#### AdvancedLauncher:

Another way to launch RetroArch games, and the only one to launch both amiga roms and GameMaker Pi ports, is using AdvancedLauncher, located also under Program Addons.


![screenshot-advlauncher-context](https://github.com/bite-your-idols/gamestarter-openelec/raw/master/assets/screenshot-advlauncher-context.png)


There is a default/example launchers/games list I created. You can edit list, scan for your games, edit emulator cores... everything using contextual menu.


![screenshot-advlauncher-edit](https://github.com/bite-your-idols/gamestarter-openelec/raw/master/assets/screenshot-advlauncher-edit.png)


#### Internet Archive ROM Launcher:

Finally, you can use Video Addons > IARL addon, it will launch Games hosted on the Internet Archive. 

![Screen #2](https://raw.githubusercontent.com/zach-morris/plugin.program.iarl/master/support/media/screen2.jpg)

More info: [IARL](https://github.com/zach-morris/plugin.program.iarl/wiki)

.

#### Amiga emulation:

Amiga emulation is based on UAE4ARM pi port, You can not launch emulator into GUI by now, but you can launch games from kodi's Advanced Launcher. Games must be ".adf" files. All files from Multi-disk games must be named the same adding "_Disk1.adf", "_Disk2.adf"... like this:
> name of the game_Disk1.adf

> name of the game_Disk2.adf

> name of the game_Disk3.adf

> ...

You will need a mouse in order to start games and a keyboard to exit, save/load states...

Also you can exit using ssh:
```
pkill uae4arm
```
> There is a work in progress libretro core port of this emulator. When it will be released I will use it instead.

.

#### Emulationstation:
If you use ssh method and you choose advanced installation (2) you will get Emulationstation front end. It can be launched using its own addon located under Program Addons > Gamestarter: Emulationstation
![screenshot-emulationstation-](https://github.com/bite-your-idols/gamestarter-openelec/raw/master/assets/screenshot-emulationstation.png)

You can customize system lists editing /storage/emulators/emulationstation/es_systems.cfg file

***
###### Tip:
Instead os using the addon you can [remap your remote](http://kodi.wiki/view/HOW-TO:Modify_keymaps) and assign to a key the following action:
```
XBMC.System.Exec("/storage/emulators/scripts/gamestarter.sh emulationstation")
```
***

.


#### GameMaker Pi:
As an extra feature, the installation will download and extract three free games from GameMaker Team. To make them work I had to make a hacklib in order to downgrade some OpenELEC libs. If you notice that this downgrade is making some curl-related issues to your system, you can toggle the hack on/off using an addon I created and installed under Program addons menu called "hacklib".

These games only work with Xbox Controller :(

You can exit them using ssh too:
```
pkill MalditaCastilla
pkill SuperCrateBox
pkill TheyNeedToBeFed
```

.



## Credits

- [Original RetroArch addon](http://openelec.tv/forum/128-addons/72972-retroarch-addon-arm-rpi) by Mezo

- RetroArch, UAE4ARM & EmulationStation compiled by [Escalade](http://openelec.tv/forum/124-raspberry-pi/80543-raspberry-pi2-3-openelec-7-0-kodi-16-0-retroarch)

- [Retroarch](http://www.libretro.com/)

- [UAE4ARM Pi](https://www.raspberrypi.org/forums/viewtopic.php?t=110488) by Chips

- [AdvancedLauncher](https://github.com/edwtjo/advanced-launcher)

- AdvancedLauncher "skin" by [tronkyfran](https://github.com/HerbFargus/es-theme-tronkyfran)

- [Internet Archive ROM Launcher](https://github.com/zach-morris/plugin.program.iarl) by ZachMorris

- [GameMaker Pi](http://yoyogames.com/pi)

- [Hacklib](http://forum.kodi.tv/showthread.php?pid=1481392#pid1481392) by Milhouse






