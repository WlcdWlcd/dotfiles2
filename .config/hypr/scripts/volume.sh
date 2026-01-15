#!/usr/bin/env bash

PLAY_SOUND="exec canberra-gtk-play -i audio-volume-change"

SOUND_PID=""

play_sound(){
     pkill -f "canberra-gtk-play.*audio-volume-change" --older-than 0.3 2>/dev/null
    
    # Запускаем новый звук
    canberra-gtk-play -i audio-volume-change &
    disown  
}

get_volume(){
    #local volume="$(amixer get Master | tail -1 | awk "{print \$4}" | tr -d "[]\n")"
    local volume="$(pamixer --get-volume)"
    echo ${volume}
}

get_mute(){
    #echo $(amixer get Master | tail -1 | awk "{print \$5}" | tr -d "[]")
    echo $(pamixer --get-mute)
}

inc_volume() {
    volume=$(get_volume)
    if [[ $volume -lt 100 ]]; then
        pamixer -u && pamixer -i 5 && notify_volume && play_sound 
    fi
}

dec_volume() {
    pamixer -u && pamixer -d 5 && notify_volume && play_sound 
}

toggle_mute(){
    pamixer -t && notify_mute
    
}

notify_volume(){
    volume=$(get_volume)
    #notify-send -t 1000 -u low "Громкость: $volume" -h "int:value:$volume" -a "volume" -h "string:x-dunst-stack-tag:volume"
    notify-send -e \
        -h string:x-canonical-private-synchronous:volume_notify \
        -h int:value:"$volume" \
        -u low \
        "volume: ${volume}%"
}


notify_mute(){
    is_mute=$(get_mute)
    if [[ "$is_mute" == "true" ]] ;then 
        #notify-send -t 1000 -u critical "звук выключен" -a "volume" -h "string:x-dunst-stack-tag:volume"
        notify-send -e \
            -h string:x-canonical-private-synchronous:mute_notify \
            -u low \
            "звук выключен"
    else
        notify-send -e \
            -h string:x-canonical-private-synchronous:mute_notify \
            -u low \
            "звук включен"

        #notify-send -t 1000 -u low "звук включен" -a "volume" -h "string:x-dunst-stack-tag:volume" 

    fi
    }


if [[ "$1" == "--get-volume" ]]; then
	get_volume
elif [[ "$1" == "--get-mute" ]]; then
	get_mute
elif [[ "$1" == "--inc" ]]; then
	inc_volume
elif [[ "$1" == "--dec" ]]; then
	dec_volume
elif [[ "$1" == "--toggle" ]]; then
	toggle_mute
elif [[ "$1" == "--get-icon" ]]; then
	get_icon
else
	get_volume
fi
