#!/bin/bash
# Update script

rm /storage/.kodi/addons/script.gamestarter/resources/bin/installed

kodi-send --action=Notification"(Gamestarter,Please launch addon to reinstall.,2000,/storage/.kodi/addons/script.gamestarter/icon.png)"
