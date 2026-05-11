#!/bin/bash

chosen=$(printf "Shutdown\nReboot\nLock\nLogout" | \
fuzzel --config ~/.config/fuzzel/powermenu.ini --dmenu --prompt " ")

case "$chosen" in
    Shutdown)
        systemctl poweroff
        ;;
    Reboot)
        systemctl reboot
        ;;
    Lock)
        hyprlock
        ;;
    Logout)
        hyprctl dispatch exit
        ;;
esac
