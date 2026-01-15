#!/usr/bin/env bash

CURDIR="$HOME/.config/themes/current"
THEME_FILE="$CURDIR/theme"

current="$(cat "$THEME_FILE" 2>/dev/null)"

if [ "$current" = "dark" ]; then
  echo "light" > "$THEME_FILE"
else
  echo "dark" > "$THEME_FILE"
fi
# sleep 1;

"$HOME/.config/themes/apply.sh"
