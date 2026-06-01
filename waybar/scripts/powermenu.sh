#!/bin/bash

chosen=$(printf "Shutdown\nReboot\nLogout" | \
fuzzel --config ~/.config/fuzzel/powermenu.ini --dmenu --hide-prompt)

case "$chosen" in
    Shutdown)
        systemctl poweroff
        ;;
    Reboot)
        systemctl reboot
        ;;
    Logout)
        hyprctl dispatch 'hl.dsp.exit()' 
        ;;
esac
