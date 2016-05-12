import xbmcaddon
import xbmcgui
import os


addon       = xbmcaddon.Addon()
addonname   = addon.getAddonInfo('name')

# script_file = os.path.realpath(__file__)
# directory = os.path.dirname(script_file)
# directory = "/storage/.kodi/addons/plugin.program.gamestarter"


# foo = xbmcplugin.getSetting(,'debug')

# primero habria que comprobar si es la priemra vez que se lanza entonces hacer la instalacion:
# xbmcgui.Dialog().ok(addonname, "Your are going to install Gamestarter into your OpenELEC system, please do not switch off your Raspberry Pi until installation is finished.")
# os.system("wget --no-check-certificate -O /storage/install-gamestarter.sh https://raw.githubusercontent.com/bite-your-idols/gamestarter-openelec/master/install-gamestarter.sh && sh /storage/install-gamestarter.sh")
# xbmcgui.Dialog().ok(addonname, "Installation done, please reboot, copy your roms and system bios and enjoy!")


# las siguientes veves pues directamente lanzariamos RetroArch
# tambien se podia incluir unas settings para decidir si prefieres lanzar retroarch o emulationstation y asi incluir los 2 addons en 1

resultado = xbmcgui.Dialog().yesno("Gamestarter: RetroArch Launcher", "Exit Kodi and run RetroArch?");

if resultado:
	# os.system("/storage/.kodi/addons/plugin.program.gamestarter/resources/gamestarter.sh retroarch")
	# os.system(directory+":/resources/gamestarter.sh retroarch")
	os.system("/storage/.kodi/addons/plugin.program.gamestarter/resources/bin/gamestarter.sh retroarch")
