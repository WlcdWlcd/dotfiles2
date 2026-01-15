#!/usr/bin/env bash


step=10
val=100


function get_light(){
    #local light="$(hyprctl hyprsunset gamma )" #| grep -oE '^[0-9]+' )"
    local light="$(light -G | grep -oE '^[0-9]+')"
    echo ${light}

}

function inc_light(){
    light -A $step & notify_light
#    for i in $(seq 1 $val); do
#        #hyprctl hyprsunset gamma +$step > /dev/null &
#        light -A $step
#        notify_light
#    done
}

function dec_light(){
    light -U $step & notify_light
#    for i in $(seq 1 $val); do
#        #hyprctl hyprsunset gamma -$step > /dev/null &
#        light -U $step
#        notify_light
#    done
}

function notify_light(){
    light=$(get_light)
    #notify-send -t 1000 -r 6666 -u low "яркость: $light%" -h "int:value:$light" -a "light" -h "string:x-dunst-stack-tag:light"
    notify-send -e \
        -h string:x-canonical-private-synchronous:brightness_notify \
        -h int:value:"$light" \
        -u low \
        -i "$icon_path" \
         "Brightness: ${light}%"
}

function stop(){
    pkill -f "bright.sh -"
}

if [[ "$1" == "--inc" ]]; then
	inc_light &
elif [[ "$1" == "--dec" ]]; then
	dec_light &
elif [[ "$1" == "--stop" ]]; then
    stop &
fi
