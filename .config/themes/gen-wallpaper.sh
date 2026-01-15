#!/usr/bin/env bash

OUT="$HOME/.config/themes/wallpapers"
WALLPAPER_CACHE="$HOME/.config/themes/current/wallpaper"
APPLY="$HOME/.config/themes/apply.sh"
mkdir -p "$OUT"

CMD=$(command -v magick || command -v convert)

# базовые цвета (можешь менять)
#C1="#0f1117"
#C2="#1a1b26"

SIZE=1920x1080

BRIGHT=$((RANDOM%16+85))   # 85-105% красного
SATURATION=$((RANDOM % 16 + 25))   # 85-105% зелёного
HUE=$((RANDOM % 8+104))   # 95-115% синего (синим пастельнее)

GRAIN=$(awk -v min=0.04 -v max=0.12 'BEGIN{srand(); print min+rand()*(max-min)}')

GAMMA=$(awk -v min=0.9 -v max=1.1 'BEGIN{srand(); print min+rand()*(max-min)}')

LEVEL_LOW=$(awk -v min=4 -v max=10 'BEGIN{srand(); print min+rand()*(max-min)}')

MODULATE="${BRIGHT},${SATURATION},${HUE}"


echo $MODULATE

H=$((RANDOM % 360))
COLOR=$(printf "hsl(%d,28%%,28%%)" "$H")

FILE="$OUT/auto-$(date +%H%M%S).png"

magick -size 1280x720 plasma:fractal \
    -level ${LEVEL_LOW},90% \
    -ordered-dither o8x8 \
    -channel B -evaluate Multiply 1.1 +channel \
    -channel R -evaluate Multiply 0.85 \
    -channel G -evaluate Multiply 0.5 \
    -modulate $MODULATE \
    -resize $SIZE: \
    "$FILE"
#  -fill none -stroke "#cdd6f4" -strokewidth 3 \

#$CMD -size 1920x1080 plasma:fractal \
#    -gravity NorthWest \
#    -blur 5x20 \
#    -sharpen 0x0.6 \
#    -contrast-stretch 0.2% \
#    -level ${LEVEL_LOW}%,100% \
#    -gamma $GAMMA \
#    -modulate $MODULATE \
#    -fill "#3a4fff" -tint 15 \
#    \( +clone -attenuate $GRAIN +noise Uniform \) \
#    -compose softlight -composite \
#    "$FILE"

echo "✔ Generated: $FILE"

echo $FILE > $WALLPAPER_CACHE


$APPLY 


