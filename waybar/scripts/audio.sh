#!/bin/bash

SINK="@DEFAULT_SINK@"

get_vol() {
    pactl get-sink-volume "$SINK" | grep -o '[0-9]\+%' | head -n1 | tr -d '%'
}

set_vol() {
    pactl set-sink-volume "$SINK" "$1%"
}

# handle scroll actions
if [[ "$1" == "up" ]]; then
    vol=$(get_vol)
    new=$((vol + 5))
    [[ $new -gt 150 ]] && new=150
    set_vol "$new"
    exit
fi

if [[ "$1" == "down" ]]; then
    vol=$(get_vol)
    new=$((vol - 5))
    [[ $new -lt 0 ]] && new=0
    set_vol "$new"
    exit
fi

# volume display
vol=$(get_vol)

# mic detection (any active recording stream)
mic_active=$(pactl list sources | grep -A10 "State: RUNNING" | grep "Name:")

icon="  "
mic_icon=""

if [[ -n "$mic_active" ]]; then
    mic_icon="<span color='#a6e3a1'></span>"
fi

echo "{\"text\":\"$icon $vol%$mic_icon\",\"tooltip\":\"Volume: $vol%\"}"
