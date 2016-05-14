# import xbmcaddon
# import xbmcgui
# import xbmcplugin
# import os
# import os.path

# addon       = xbmcaddon.Addon()
# addonname   = addon.getAddonInfo('name')

# script_file = os.path.realpath(__file__)
# directory = os.path.dirname(script_file)

# # primero habria que comprobar si es la priemra vez que se lanza entonces hacer la instalacion:
# if os.path.isfile(directory+"/resources/bin/installed") == False: 
#  	xbmcgui.Dialog().ok(addonname, "This is the first time you run Gamestarter. We are going to make a first-time-setup, please do not switch off your Raspberry Pi until process is finished.")
#  	os.system("sh "+directory+"/resources/bin/install.sh")
#  	xbmcgui.Dialog().ok(addonname, "Done. Please reboot, copy your roms and system bios and enjoy!")

# # las siguientes veces directamente lanzariamos RetroArch o Emulationstation
# else:
# 	frontend = xbmcplugin.getSetting(int(sys.argv[1]),'frontend')
# 	resultado = xbmcgui.Dialog().yesno("Gamestarter Launcher", "Exit Kodi and run "+frontend+"?");
# 	if resultado:
# 		if frontend=="EmulationStation":
# 			os.system(directory+"/resources/bin/gamestarter.sh emulationstation")
# 		else:
# 			os.system(directory+"/resources/bin/gamestarter.sh retroarch")




import sys
import xbmcgui
import xbmcplugin

addon_handle = int(sys.argv[1])

xbmcplugin.setContent(addon_handle, 'movies')

url1 = 'System.Exec(/storage/.kodi/addons/script.gamestarter/resources/bin/gamestarter.sh retroarch)'
li1 = xbmcgui.ListItem('RetroArch', iconImage='/storage/.kodi/addons/script.gamestarter/resources/media/retroarch.jpg')
# li.setArt({'fanart': my_addon.getAddonInfo('fanart')})
xbmcplugin.addDirectoryItem(handle=addon_handle, url=url1, listitem=li1)

url2 = 'System.Exec(/storage/.kodi/addons/script.gamestarter/resources/bin/gamestarter.sh emulationstation)'
li2 = xbmcgui.ListItem('EmulationStation', iconImage='/storage/.kodi/addons/script.gamestarter/resources/media/emulationstation.jpg')
# li.setArt({'fanart': my_addon.getAddonInfo('fanart')})
xbmcplugin.addDirectoryItem(handle=addon_handle, url=url2, listitem=li2)

xbmcplugin.endOfDirectory(addon_handle)

# # http://kodi.wiki/view/Audio/video_add-on_tutorial
