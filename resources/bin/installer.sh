#!/bin/bash
# Script for downloading and installing Gamestarter

#Welcome message
echo '*******************************************************************************' 
echo 'Installing Gamestarter v-1.0.1' 
echo '*******************************************************************************'

# create/setup directories
mkdir -p /storage/downloads
mkdir -p /storage/emulators

# descargar retroarch y los cores
echo ''
echo '::Gamestarter-01/10:: -> downloading RetroArch...' 
echo ''
wget --no-check-certificate -O /storage/downloads/retroarch.tar.gz https://github.com/bite-your-idols/gamestarter-openelec/blob/master/packages/retroarch.tar.gz?raw=true
tar -xf /storage/downloads/retroarch.tar.gz -C /storage/emulators/ -xz
rm /storage/downloads/retroarch.tar.gz

echo '' 
echo '::Gamestarter-02/10:: -> downloading Libretro cores...'
echo ''
mkdir -p /storage/emulators/retroarch/cores
wget --no-check-certificate -O /storage/downloads/libretro-part1.tar.gz https://github.com/bite-your-idols/gamestarter-openelec/blob/master/packages/libretro-part1.tar.gz?raw=true
tar -xf /storage/downloads/libretro-part1.tar.gz -C /storage/emulators/retroarch/cores/ -xz
wget --no-check-certificate -O /storage/downloads/libretro-part2.tar.gz https://github.com/bite-your-idols/gamestarter-openelec/blob/master/packages/libretro-part2.tar.gz?raw=true
tar -xf /storage/downloads/libretro-part2.tar.gz -C /storage/emulators/retroarch/cores/ -xz
rm /storage/downloads/libretro-part1.tar.gz
rm /storage/downloads/libretro-part2.tar.gz


# descargar amiga
echo ''
echo '::Gamestarter-03/10:: -> downloading uae4arm...'
echo '' 
wget --no-check-certificate -O /storage/downloads/uae4arm.tar.gz https://github.com/bite-your-idols/gamestarter-openelec/blob/master/packages/uae4arm.tar.gz?raw=true
tar -xf /storage/downloads/uae4arm.tar.gz -C /storage/emulators/ -xz
mkdir -p /storage/emulators/roms/amiga
# cp /storage/emulators/uae4arm/conf/example-config.uae /storage/emulators/roms/amiga
rm /storage/downloads/uae4arm.tar.gz


# descargar emulationstation
echo ''
echo '::Gamestarter-04/10:: -> downloading emulationstation...'
echo '' 
read -r -p "Do you want to install EmulationStation Frontend (Only works in OpenELEC 7+)? [y/n] " response
if [ $response == "y" ] || [ $response == "Y" ]
then
    wget --no-check-certificate -O /storage/downloads/emulationstation.tar.gz https://github.com/bite-your-idols/gamestarter-openelec/blob/master/packages/emulationstation.tar.gz?raw=true
	tar -xf /storage/downloads/emulationstation.tar.gz -C /storage/emulators/ -xz
	ln -s /storage/emulators/emulationstation /storage/.config/emulationstation
	rm /storage/downloads/emulationstation.tar.gz
	chmod a+x /storage/emulators/emulationstation/emulationstation

	# instalar el addon/libs de emulationstation
	# wget --no-check-certificate -O /storage/downloads/script.gamestarter.uae4arm.tar.gz https://github.com/bite-your-idols/script.gamestarter.uae4arm/archive/0.0.2.tar.gz
	wget --no-check-certificate -O /storage/downloads/script.gamestarter.emulationstation.tar.gz https://github.com/bite-your-idols/script.gamestarter.emulationstation/archive/master.tar.gz
	tar -xf /storage/downloads/script.gamestarter.emulationstation.tar.gz -C /storage/.kodi/addons/ -xz
	rm /storage/downloads/script.gamestarter.emulationstation.tar.gz
# else
    #do_something_else
fi


# descargar scripts, permisos de escritura y carpetas vacias
echo ''
echo '::Gamestarter-05/10:: -> downloading Gamestarter scripts...' 
echo ''
mkdir -p /storage/emulators/scripts
wget --no-check-certificate -O /storage/emulators/scripts/gamestarter.sh https://raw.githubusercontent.com/bite-your-idols/gamestarter-openelec/master/scripts/gamestarter.sh
wget --no-check-certificate -O /storage/emulators/scripts/gamestarter.start https://raw.githubusercontent.com/bite-your-idols/gamestarter-openelec/master/scripts/gamestarter.start
chmod a+x /storage/emulators/scripts/gamestarter.sh
chmod a+x /storage/emulators/scripts/gamestarter.start
chmod a+x /storage/emulators/retroarch/retroarch
chmod a+x /storage/emulators/uae4arm/uae4arm
mkdir -p /storage/emulators/bios
mkdir -p /storage/emulators/saves
# mkdir -p /storage/emulators/roms

# añadir audio al config.txt
mount -o remount,rw /flash
#nano /flash/config.txt 
echo 'dtparam=audio=on' >> /flash/config.txt


# instalar el addon de Retroarch
echo ''
echo '::Gamestarter-06/10:: -> downloading RetroArch launcher addon...' 
echo ''
# wget --no-check-certificate -O /storage/downloads/script.gamestarter.retroarch.tar.gz https://github.com/bite-your-idols/script.gamestarter.retroarch/archive/0.0.2.tar.gz
wget --no-check-certificate -O /storage/downloads/script.gamestarter.retroarch.tar.gz https://github.com/bite-your-idols/script.gamestarter.retroarch/archive/master.tar.gz
tar -xf /storage/downloads/script.gamestarter.retroarch.tar.gz -C /storage/.kodi/addons/ -xz
rm /storage/downloads/script.gamestarter.retroarch.tar.gz


# instalar el addon/libs de uae4arm
echo ''
echo '::Gamestarter-07/10:: -> downloading uae4arm launcher addon and libs...' 
echo ''
wget --no-check-certificate -O /storage/downloads/iarl.tar.gz https://github.com/zach-morris/plugin.program.iarl/archive/master.tar.gz
tar -xf /storage/downloads/iarl.tar.gz -C /storage/.kodi/addons/ -xz
wget --no-check-certificate -O /storage/downloads/iarl-requires.tar.gz https://github.com/bite-your-idols/gamestarter-openelec/raw/master/packages/iarl-requires.tar.gz
tar -xf /storage/downloads/iarl-requires.tar.gz -C /storage/.kodi/addons/ -xz
# rm /storage/.kodi/addons/plugin.program.iarl-master/resources/bin/romlaunch_OE_RPi2.sh
# wget --no-check-certificate -O /storage/.kodi/addons/plugin.program.iarl-master/resources/bin/romlaunch_OE_RPi2.sh https://raw.githubusercontent.com/bite-your-idols/gamestarter-openelec/master/scripts/iarl/romlaunch_OE_RPi2.sh
# chmod a+x /storage/.kodi/addons/plugin.program.iarl-master/resources/bin/romlaunch_OE_RPi2.sh
rm /storage/downloads/iarl.tar.gz
rm /storage/downloads/iarl-requires.tar.gz



# instalar advanced launcher, launchers.xml/symlink y caratulas
echo ''
echo '::Gamestarter-08/10:: -> downloading AdvancedLauncher, assets and sample roms...'
echo ''
# wget --no-check-certificate -O /storage/downloads/advanced.launcher.tar.gz https://github.com/bite-your-idols/advanced-launcher/archive/2.5.8.tar.gz
wget --no-check-certificate -O /storage/downloads/advanced.launcher.tar.gz https://github.com/bite-your-idols/gamestarter-openelec/raw/master/packages/advanced-launcher-master.tar.gz
tar -xf /storage/downloads/advanced.launcher.tar.gz -C /storage/.kodi/addons/ -xz

wget --no-check-certificate -O /storage/downloads/frontend.tar.gz https://github.com/bite-your-idols/gamestarter-openelec/blob/master/packages/frontend.tar.gz?raw=true
tar -xf /storage/downloads/frontend.tar.gz -C /storage/emulators/ -xz

mkdir /storage/.kodi/userdata/addon_data/plugin.program.advanced.launcher
ln -s /storage/emulators/advancedlauncher/launchers.xml  /storage/.kodi/userdata/addon_data/plugin.program.advanced.launcher/launchers.xml

rm /storage/downloads/advanced.launcher.tar.gz
rm /storage/downloads/frontend.tar.gz

# instalar Internet Archive ROM Launcher
echo ''
echo '::Gamestarter-09/10:: -> downloading Internet Archive ROM Launcher addon...'
echo ''
wget --no-check-certificate -O /storage/downloads/iarl.tar.gz https://github.com/zach-morris/plugin.program.iarl/archive/master.tar.gz
tar -xf /storage/downloads/iarl.tar.gz -C /storage/.kodi/addons/ -xz
# rm /storage/.kodi/addons/plugin.program.iarl-master/resources/bin/romlaunch_OE_RPi2.sh
# wget --no-check-certificate -O /storage/.kodi/addons/plugin.program.iarl-master/resources/bin/romlaunch_OE_RPi2.sh https://raw.githubusercontent.com/bite-your-idols/gamestarter-openelec/master/scripts/iarl/romlaunch_OE_RPi2.sh
# chmod a+x /storage/.kodi/addons/plugin.program.iarl-master/resources/bin/romlaunch_OE_RPi2.sh
rm /storage/downloads/iarl.tar.gz



# Lo de Gamemaker Pi
echo ''
echo '::Gamestarter-10/10:: -> downloading GameMaker Pi ports and requiered libs...'
echo ''

read -r -p "Do you want to install GameMaker Pi ports (Only sound in OpenELEC 6)? [y/n] " response
if [ $response == "y" ] || [ $response == "Y" ]
then
    wget --no-check-certificate -O /storage/downloads/MalditaCastilla.tar.gz https://www.yoyogames.com/download/pi/castilla
	wget --no-check-certificate -O /storage/downloads/SuperCrateBox.tar.gz https://www.yoyogames.com/download/pi/crate
	wget --no-check-certificate -O /storage/downloads/TheyNeedToBeFed.tar.gz https://www.yoyogames.com/download/pi/tntbf
	# mkdir /storage/emulators/roms/ports
	tar xvzf /storage/downloads/MalditaCastilla.tar.gz -C /storage/emulators/roms/ports/
	tar xvzf /storage/downloads/SuperCrateBox.tar.gz -C /storage/emulators/roms/ports/
	tar xvzf /storage/downloads/TheyNeedToBeFed.tar.gz -C /storage/emulators/roms/ports/
	wget --no-check-certificate -O /storage/emulators/roms/ports/MalditaCastilla.sh https://raw.githubusercontent.com/bite-your-idols/gamemaker-openelec/master/scripts/MalditaCastilla.sh
	wget --no-check-certificate -O /storage/emulators/roms/ports/SuperCrateBox.sh https://raw.githubusercontent.com/bite-your-idols/gamemaker-openelec/master/scripts/SuperCrateBox.sh
	wget --no-check-certificate -O /storage/emulators/roms/ports/TheyNeedToBeFed.sh https://raw.githubusercontent.com/bite-your-idols/gamemaker-openelec/master/scripts/TheyNeedToBeFed.sh
	wget --no-check-certificate -O /storage/emulators/roms/ports/CaveStory.sh https://raw.githubusercontent.com/bite-your-idols/gamestarter-openelec/master/scripts/ports/CaveStory.sh
	chmod a+x /storage/emulators/roms/ports/MalditaCastilla.sh
	chmod a+x /storage/emulators/roms/ports/SuperCrateBox.sh
	chmod a+x /storage/emulators/roms/ports/TheyNeedToBeFed.sh
	chmod a+x /storage/emulators/roms/ports/CaveStory.sh

	rm /storage/downloads/MalditaCastilla.tar.gz
	rm /storage/downloads/SuperCrateBox.tar.gz
	rm /storage/downloads/TheyNeedToBeFed.tar.gz

	wget --no-check-certificate -O /storage/downloads/gamemaker-libs.tar.gz https://github.com/bite-your-idols/gamemaker-openelec/raw/master/packages/gamemaker-libs.tar.gz?raw=true
	tar -xf /storage/downloads/gamemaker-libs.tar.gz -C /storage/ -xz

	rm /storage/downloads/gamemaker-libs.tar.gz

	# wget --no-check-certificate -O /storage/downloads/script.hacklib.tar.gz https://github.com/bite-your-idols/script.hacklib/archive/0.0.2.tar.gz
	wget --no-check-certificate -O /storage/downloads/script.hacklib.tar.gz https://github.com/bite-your-idols/script.hacklib/archive/master.tar.gz
	tar -xf /storage/downloads/script.hacklib.tar.gz -C /storage/.kodi/addons/ -xz
	# cp /storage/.kodi/addons/script.hacklib-master/autostart.sh /storage/.config
	echo '[ $PPID -eq 1 -a -f /storage/.kodi/addons/script.hacklib-master/bin/hacklib ] && . /storage/.kodi/addons/script.hacklib-master/bin/hacklib' >> /storage/.config/autostart.sh
	chmod +x /storage/.config/autostart.sh
	chmod a+x /storage/.kodi/addons/script.hacklib-master/bin/hacklib
	rm /storage/downloads/script.hacklib.tar.gz
#else
    #do_something_else
fi


# end installation
rm /storage/install-gamestarter.sh
echo '----'
echo '::Gamestarter:: -> Installation completed, now reboot and enjoy!!'
echo '----'
