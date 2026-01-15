#!/usr/bin/env bash

THEME_FILE="$HOME/.config/themes/current/theme"

theme="$(cat "$THEME_FILE" 2>/dev/null)"

if [ "$theme" = "dark" ]; then
    echo "🌙"
else
  echo "☀️"
fi
