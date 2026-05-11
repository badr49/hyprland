#!/bin/bash

status=$(playerctl status 2>/dev/null)

if [[ "$status" == "Playing" || "$status" == "Paused" ]]; then
    title=$(playerctl metadata title 2>/dev/null)
    artist=$(playerctl metadata artist 2>/dev/null)

    [ -z "$title" ] && title="Unknown"
    [ -z "$artist" ] && artist="Radio?"

    text="$artist $title"

    # truncate for bar
    short_text=$(echo "$text" | cut -c1-45)

    if [[ "$status" == "Playing" ]]; then
        icon="󰏤"
        class="playing"
    else
        icon="󰐊"
        class="paused"
    fi

    echo "{\"text\":\"$icon  $short_text\",\"class\":\"$class\",\"tooltip\":\"$text\"}"
elif [[ "$status" != "Playing" ]]; then
	exit 0
fi
