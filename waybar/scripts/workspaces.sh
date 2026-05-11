#!/usr/bin/env bash

workspaces=$(hyprctl workspaces -j 2>/dev/null || echo "[]")
clients=$(hyprctl clients -j 2>/dev/null || echo "[]")

out=""

while IFS= read -r ws; do
    id=$(echo "$ws" | jq -r '.id')
    focused=$(echo "$ws" | jq -r '.focused')

    client=$(echo "$clients" | jq -c --argjson id "$id" '
        [.[] | select(.workspace.id == $id)] | .[0]
    ')

    app=$(echo "$client" | jq -r '.class // .appId // ""')
    title=$(echo "$client" | jq -r '.title // ""')

    icon="󰮤"

    case "$app" in
        zen|firefox)
            icon=" "
            ;;
        kitty|Kitty)
            icon=" "
            ;;
        Spotify|spotify)
            icon=" "
            ;;
        discord|Discord)
            icon=" "
            ;;
        steam)
            icon=" "
            ;;
        code|Code|zed|Zed|windsurf|Windsurf)
            icon=" "
            ;;
        gamescope)
            if [[ "$title" == *"Counter-Strike"* ]]; then
                icon="󰊗 "
            else
                icon="󰵇 "
            fi
            ;;
    esac

    if [ "$focused" = "true" ]; then
        out+="<span foreground='#ffffff'>$icon</span> "
    else
        out+="$icon "
    fi

done < <(echo "$workspaces" | jq -c 'sort_by(.id)[]')

echo "$out"
