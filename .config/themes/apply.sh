#!/usr/bin/env bash

CURDIR="${HOME}/.config/themes/current"
THEME=$(cat "${CURDIR}/theme")
WALLPAPER=$(cat "${CURDIR}/wallpaper")

echo $THEME
echo $WALLPAPER


matugen image $WALLPAPER --contrast 0 -m $THEME -t scheme-tonal-spot --show-colors | swww img "$WALLPAPER" --transition-type fade --transition-duration 1 &
