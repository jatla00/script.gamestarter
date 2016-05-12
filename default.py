import xbmcaddon
import xbmcgui
import xbmcplugin
import os
import os.path

addon       = xbmcaddon.Addon()
addonname   = addon.getAddonInfo('name')

script_file = os.path.realpath(__file__)
directory = os.path.dirname(script_file)

# primero habria que comprobar si es la priemra vez que se lanza entonces hacer la instalacion:
if os.path.isfile(directory+"/resources/bin/installer.sh") == True: 
 	xbmcgui.Dialog().ok(addonname, "This is the first time you run this addon. You are going to install Gamestarter into your system, please do not switch off your Raspberry Pi until installation is finished.")
 	os.system("sh "+directory+"/resources/bin/installer.sh")
 	xbmcgui.Dialog().ok(addonname, "Installation done, please reboot, copy your roms and system bios and enjoy!")

# las siguientes veces directamente lanzariamos RetroArch o Emulationstation
else:
	frontend = xbmcplugin.getSetting(int(sys.argv[1]),'frontend')
	resultado = xbmcgui.Dialog().yesno("Gamestarter Launcher", "Exit Kodi and run "+frontend+"?");
	if resultado:
		if frontend=="EmulationStation":
			os.system(directory+"/resources/bin/gamestarter.sh emulationstation")
		else:
			os.system(directory+"/resources/bin/gamestarter.sh retroarch")