import xbmcaddon
import xbmcgui
import os

addon       = xbmcaddon.Addon()
addonname   = addon.getAddonInfo('name')

xbmcgui.Dialog().ok(addonname, "Done!")
