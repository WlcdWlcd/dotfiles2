#!/bin/bash

while [[ $(hyprctl activewindow -j | jq -r '.initialClass') == "hyprland" ]]; do
    brightnessctl set 10%-  # Увеличиваем яркость на 2% каждый шаг
    sleep 0.05            # Интервал (0.05 сек = 50 мс, можно уменьшить для большей скорости)
done
