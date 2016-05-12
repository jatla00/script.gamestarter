#!/bin/sh
. /etc/profile

DIR="/storage/.kodi/addons/plugin.program.gamestarter"

systemd-run $DIR/resources/bin/gamestarter.start "$@"