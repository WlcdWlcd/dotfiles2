#!/bin/bash

PIDFILE="$HOME/.cache/mechsim.pid"
WOFI_SCRIPT="$HOME/.config/scripts/wofi/mechsim-wofi.sh"

is_running() {
  [[ -f "$PIDFILE" ]] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null
}

case "$1" in
  toggle)
    if is_running; then
      kill "$(cat "$PIDFILE")" 2>/dev/null
      rm -f "$PIDFILE"
    else
      "$WOFI_SCRIPT" &
    fi
    ;;
  menu)
    "$WOFI_SCRIPT" &
    ;;
esac

if is_running; then
  echo "⌨️ ON"
else
  echo "⌨️ OFF"
fi

