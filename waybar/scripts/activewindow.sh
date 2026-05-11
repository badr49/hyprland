#!/usr/bin/env bash

window=$(hyprctl activewindow -j)

class=$(echo "$window" | jq -r '.class')
title=$(echo "$window" | jq -r '.title')

max_len=50

if [[ ${#title} -gt $max_len ]]; then
    title="${title:0:$max_len}…"
fi

icon="󰮤 "

case "$class" in
    zen)
        icon=" "
        ;;
    Spotify)
        icon=" "
        ;;
    discord)
        icon=" "
        ;;
    code|Code)
        icon=" "
        ;;
    steam)
        icon=" "
        ;;
    gamescope)
        if [[ "$title" == *"Counter-Strike"* ]]; then
            icon="󰊗 "
        else
            icon="󰊖 "
        fi
        ;;
esac

echo "{\"text\":\"$title\"}"
