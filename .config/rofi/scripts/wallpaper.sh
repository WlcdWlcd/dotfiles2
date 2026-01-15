#!/usr/bin/env bash


THEMEDIR="$HOME/.config/themes"
WALLDIR="$THEMEDIR/wallpapers"
CURDIR="$THEMEDIR/current/"

choice=$(
  for img in "$WALLDIR"/*; do
    name="$(basename "$img")"
    printf '%s\0icon\x1f%s\n' "$name" "$img"
  done | rofi -dmenu -p "Wallpaper" -show-icons -theme ~/.config/rofi/themes/wallpaper.rasi --alow-images
)
[ -z "$choice" ] && exit 0


WALL="$WALLDIR/$choice"

#swww img "$WALL" --transition-type grow --transition-duration 0.6

printf '%s\n' "$WALL" > "$CURDIR/wallpaper"

"$THEMEDIR/apply.sh"
