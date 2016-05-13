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
if os.path.isfile(directory+"/resources/bin/setup.sh") == True: 
 	xbmcgui.Dialog().ok(addonname, "This is the first time you run this addon. We are going to make some firts-time-setup to Gamestarter, please do not switch off your Raspberry Pi until process is finished.")
 	os.system("sh "+directory+"/resources/bin/setup.sh")
 	xbmcgui.Dialog().ok(addonname, "Done. Please reboot, copy your roms and system bios and enjoy!")

# las siguientes veces directamente lanzariamos RetroArch o Emulationstation
else:
	frontend = xbmcplugin.getSetting(int(sys.argv[1]),'frontend')
	resultado = xbmcgui.Dialog().yesno("Gamestarter Launcher", "Exit Kodi and run "+frontend+"?");
	if resultado:
		if frontend=="EmulationStation":
			os.system(directory+"/resources/bin/gamestarter.sh emulationstation")
		else:
			os.system(directory+"/resources/bin/gamestarter.sh retroarch")
