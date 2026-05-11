#!/bin/bash

active_apps=$(pactl list | awk '
/application.name = / {
    match($0, /"([^"]+)"/)
    app = substr($0, RSTART + 1, RLENGTH - 2)
}

/media.class = "Stream\/Input\/Audio"/ {
    if (app != "" &&
        app != "PulseAudio Volume Control" &&
        app != "Easy Effects") {
        seen[app] = 1
    }
}

END {
    for (a in seen)
        print a
}
')

active_port=$(pactl list sources | awk '
/Name: alsa_input.pci-0000_00_1f.3.analog-stereo/ {found=1}
/Active Port:/ && found {
    print $3
    exit
}
')

if [[ "$active_port" == "analog-input-headset-mic" || \
      "$active_port" == "analog-input-internal-mic" ]]; then

    # Mic port exists and is active

    if [[ -n "$active_apps" ]]; then

        # App currently using mic
        if [[ "$active_port" == "analog-input-headset-mic" ]]; then
            echo '{"text":"","class":"headset"}'
        else
            echo '{"text":"","class":"internal"}'
        fi

    else
        # Mic available but idle
        echo '{"text":"","class":"idle"}'
    fi

else
    # No mic port active
    echo '{"text":" ","class":"muted"}'
fi
