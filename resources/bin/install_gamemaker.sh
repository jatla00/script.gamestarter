#!/bin/bash
# Script for GameMaker Pi ports installation 
kodi-send --action=Notification"(Gamestarter,Installing GameMaker Pi ports,,/storage/.kodi/addons/script.gamestarter/icon.png)"
wget --no-check-certificate -O /storage/install-gamemaker-openelec.sh https://raw.githubusercontent.com/bite-your-idols/gamemaker-openelec/master/gamemaker-openelec.sh
kodi-send --action=Notification"(Gamestarter,GameMaker ports installed,,/storage/.kodi/addons/script.gamestarter/icon.png)"
# for more info visit: https://github.com/bite-your-idols/gamemaker-openelec