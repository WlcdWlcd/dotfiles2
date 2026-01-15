#!/usr/bin/env bash

#CONFIG="$HOME/.config/hypr/wofi/config/config"
#STYLE="$HOME/.config/hypr/wofi/colors/style.css"
if [[ ! $(pidof wofi) ]]; then
    echo "wofi"
    #wofi -I -Dimage_size=24 --conf "${CONFIG}" -t alacritty --style "${STYLE}" "$@"
    wofi "$@"
else
    echo "kill"
    pkill wofi
fi
