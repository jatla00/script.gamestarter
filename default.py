import xbmcaddon
import xbmcgui
import os
import os.path

addon       = xbmcaddon.Addon()
addonname   = addon.getAddonInfo('name')
addonPath   = addon.getAddonInfo('path')


# script_file = os.path.realpath(__file__)
# directory = os.path.dirname(script_file)
# directory = "/storage/.kodi/addons/plugin.program.gamestarter"
INSTALLER_PATH = os.path.join(addonPath, "/resources/bin/installer.sh")

# primero habria que comprobar si es la priemra vez que se lanza entonces hacer la instalacion:
instalar = os.path.isfile("/storage/.kodi/addons/script.gamestarter/resources/bin/installer.sh") 

if instalar:
	xbmcgui.Dialog().ok(addonname, "This is the first time you run this addon. You are going to install Gamestarter into your system, please do not switch off your Raspberry Pi until installation is finished.")
	# os.system("wget --no-check-certificate -O /storage/install-gamestarter.sh https://raw.githubusercontent.com/bite-your-idols/gamestarter-openelec/master/install-gamestarter.sh && sh /storage/install-gamestarter.sh")
	os.system("sh /storage/.kodi/addons/script.gamestarter/resources/bin/installer.sh")
	xbmcgui.Dialog().ok(addonname, "Installation done, please reboot, copy your roms and system bios and enjoy!")


# las siguientes veces directamente lanzariamos RetroArch o Emulationstation
# launcher = xbmcplugin.getSetting(,'launcher_default')

resultado = xbmcgui.Dialog().yesno("Gamestarter: RetroArch Launcher", "Exit Kodi and run RetroArch?");

if resultado:
	# os.system("/storage/.kodi/addons/plugin.program.gamestarter/resources/gamestarter.sh retroarch")
	# os.system(directory+":/resources/gamestarter.sh retroarch")
	os.system("/storage/.kodi/addons/script.gamestarter/resources/bin/gamestarter.sh retroarch")
