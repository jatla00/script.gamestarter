#!/bin/bash
# Script for installing Gamestarter

#Welcome message
echo 'Installing Gamestarter v-1.0.1' 

# hacer ejecutables los scripts y binarios
chmod a+x /storage/.kodi/addons/script.gamestarter/resources/bin/gamestarter.sh
chmod a+x /storage/.kodi/addons/script.gamestarter/resources/bin/gamestarter.start
chmod a+x /storage/.kodi/addons/script.gamestarter/resources/bin/retroarch
chmod a+x /storage/.kodi/addons/script.gamestarter/resources/bin/emulationstation
chmod a+x /storage/.kodi/addons/script.gamestarter/resources/bin/uae4arm

#copiar los packages de data a .config
tar -xf /storage/.kodi/addons/script.gamestarter/resources/data/retroarch.tar.gz -C /storage/.config/ -xz
tar -xf /storage/.kodi/addons/script.gamestarter/resources/data/libretro-part1.tar.gz -C /storage/.config/retroarch/cores/ -xz
tar -xf /storage/.kodi/addons/script.gamestarter/resources/data/libretro-part2.tar.gz -C /storage/.config/retroarch/cores/ -xz
tar -xf /storage/.kodi/addons/script.gamestarter/resources/data/libretro-part3.tar.gz -C /storage/.config/retroarch/cores/ -xz
tar -xf /storage/.kodi/addons/script.gamestarter/resources/data/emulationstation.tar.gz -C /storage/.config/ -xz
tar -xf /storage/.kodi/addons/script.gamestarter/resources/data/emulators.tar.gz -C /storage/ -xz

# descargar packages
# retroarch y cores
#wget --no-check-certificate -O /storage/retroarch.tar.gz https://github.com/bite-your-idols/gamestarter-openelec/blob/master/packages/retroarch.tar.gz?raw=true
#tar -xf /storage/downloads/retroarch.tar.gz -C /storage/emulators/ -xz
#rm /storage/retroarch.tar.gz
# wget --no-check-certificate -O /storage/libretro-part1.tar.gz https://github.com/bite-your-idols/gamestarter-openelec/blob/master/packages/libretro-part1.tar.gz?raw=true
# tar -xf /storage/libretro-part1.tar.gz -C /storage/.config/retroarch/cores/ -xz
# wget --no-check-certificate -O /storage/libretro-part2.tar.gz https://github.com/bite-your-idols/gamestarter-openelec/blob/master/packages/libretro-part2.tar.gz?raw=true
# tar -xf /storage/downloads/libretro-part2.tar.gz -C /storage/.config/retroarch/cores/ -xz
# rm /storage/libretro-part1.tar.gz
# rm /storage/libretro-part2.tar.gz

# amiga
# wget --no-check-certificate -O /storage/downloads/uae4arm.tar.gz https://github.com/bite-your-idols/gamestarter-openelec/blob/master/packages/uae4arm.tar.gz?raw=true
# tar -xf /storage/downloads/uae4arm.tar.gz -C /storage/emulators/ -xz
# mkdir -p /storage/emulators/roms/amiga
# cp /storage/emulators/uae4arm/conf/example-config.uae /storage/emulators/roms/amiga
# rm /storage/downloads/uae4arm.tar.gz

# emulationstation
# wget --no-check-certificate -O /storage/downloads/emulationstation.tar.gz https://github.com/bite-your-idols/gamestarter-openelec/blob/master/packages/emulationstation.tar.gz?raw=true
# tar -xf /storage/downloads/emulationstation.tar.gz -C /storage/emulators/ -xz
# ln -s /storage/emulators/emulationstation /storage/.config/emulationstation
# rm /storage/downloads/emulationstation.tar.gz
# chmod a+x /storage/emulators/emulationstation/emulationstation

# instalar advanced launcher, launchers.xml/symlink y caratulas
# wget --no-check-certificate -O /storage/downloads/advanced.launcher.tar.gz https://github.com/bite-your-idols/advanced-launcher/archive/2.5.8.tar.gz
# wget --no-check-certificate -O /storage/advanced.launcher.tar.gz https://github.com/bite-your-idols/gamestarter-openelec/raw/master/packages/advanced-launcher-master.tar.gz
# tar -xf /storage/advanced.launcher.tar.gz -C /storage/.kodi/addons/ -xz
# wget --no-check-certificate -O /storage/downloads/frontend.tar.gz https://github.com/bite-your-idols/gamestarter-openelec/blob/master/packages/frontend.tar.gz?raw=true
# tar -xf /storage/downloads/frontend.tar.gz -C /storage/emulators/ -xz
# mkdir /storage/.kodi/userdata/addon_data/plugin.program.advanced.launcher
# ln -s /storage/.config/advancedlauncher/launchers.xml  /storage/.kodi/userdata/addon_data/plugin.program.advanced.launcher/launchers.xml
# rm /storage/advanced.launcher.tar.gz
# rm /storage/downloads/frontend.tar.gz

# añadir audio al config.txt
# mount -o remount,rw /flash
# echo 'dtparam=audio=on' >> /flash/config.txt

# borramos los zips de data y renombramos el instalador
# rm /storage/.kodi/addons/script.gamestarter/resources/data/retroarch.tar.gz
# rm /storage/.kodi/addons/script.gamestarter/resources/data/libretro-part1.tar.gz
# rm /storage/.kodi/addons/script.gamestarter/resources/data/libretro-part2.tar.gz
# rm /storage/.kodi/addons/script.gamestarter/resources/data/libretro-part3.tar.gz
# rm /storage/.kodi/addons/script.gamestarter/resources/data/emulationstation.tar.gz
# rm /storage/.kodi/addons/script.gamestarter/resources/data/emulators.tar.gz

mv /storage/.kodi/addons/script.gamestarter/resources/bin/installer.sh /storage/.kodi/addons/script.gamestarter/resources/bin/installer_done.sh 

# end installation
echo '::Gamestarter:: -> Installation completed, now reboot and enjoy!!'