#!/usr/bin/env bash

WALLDIR="$HOME/Pictures"

selection=$(find "$WALLDIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.webp" \) \
    | sed "s|$WALLDIR/||" \
    | sort \
    | fuzzel --dmenu --prompt="Wallpaper: ")

[[ -z "$selection" ]] && exit 0

file="$WALLDIR/$selection"

# apply with hyprpaper (instant, no transitions)
hyprctl hyprpaper preload "$file"
hyprctl hyprpaper wallpaper ",$file"
