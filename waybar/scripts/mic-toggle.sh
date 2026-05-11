#!/bin/bash

SOURCE=$(pactl get-default-source)

HEADSET="analog-input-headset-mic"
INTERNAL="analog-input-internal-mic"

current=$(pactl list sources | awk -v src="$SOURCE" '
    $0 ~ src {found=1}
    found && /Active Port:/ {print $3; exit}
')

if echo "$current" | grep -qi headset; then
    pactl set-source-port "$SOURCE" "$INTERNAL"
else
    pactl set-source-port "$SOURCE" "$HEADSET"
fi
