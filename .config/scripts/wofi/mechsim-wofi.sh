#!/bin/bash


mapfile -t SOUNDS < <(
  mechsim -l \
  | sed '1,/^======================$/d' \
  | awk '{$1=$1};1'
)

TURN_OFF="turn off"
TURN_ON="turn on"


VOLUME=20   # тихо, под фон
PIDFILE="$HOME/.cache/mechsim.pid"

is_running() {
  [[ -f "$PIDFILE" ]] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null
}

start_mechsim() {
  mechsim -s "$1" -V "$VOLUME" &
  echo $! > "$PIDFILE"
}

stop_mechsim() {
  kill "$(cat "$PIDFILE")" 2>/dev/null
  rm -f "$PIDFILE"
}

MENU_ITEMS=()

if is_running; then
  MENU_ITEMS+="$TURN_OFF"
else
  MENU_ITEMS+=("$TURN_ON")
fi

MENU_ITEMS+=("────────────")

for s in "${SOUNDS[@]}"; do
  MENU_ITEMS+=("🔊  $s")
done

CHOICE=$(printf "%s\n" "${MENU_ITEMS[@]}" | wofi --dmenu --prompt "MechSim" --cache-file /dev/null)


case "$CHOICE" in
  "$TURN_OFF")
    stop_mechsim
    ;;
  "$TURN_ON")
    start_mechsim "${SOUNDS[0]}"
    ;;
  🔊*)
    SOUND=$(echo "$CHOICE" | sed 's/🔊  //')
    is_running && stop_mechsim
    start_mechsim "$SOUND"
    ;;
esac
