#!/bin/bash

# Script SOLO para pausar / reanudar grabación de gpu-screen-recorder
# No inicia ni detiene grabaciones, solo envía SIGUSR2 al proceso activo



# Archivos de estado (los mismos que usa o puede usar el script original)
RECORDING_FILE="/tmp/omarchy-screenrecord-filename"
PAUSED_STATE_FILE="/tmp/omarchy-screenrecord-paused"


notify() {
    notify-send "$1" "$2" -u "${3:-normal}" -t "${4:-2200}"
}


is_recording_active() {
    pgrep -f "^gpu-screen-recorder" >/dev/null
}

is_paused() {
    [[ -f "$PAUSED_STATE_FILE" ]]
}

toggle_pause() {
    if ! is_recording_active; then
        notify-send "No hay grabación activa"
        exit 1
    fi

    #  pausa si estaba grabando, reanuda si estaba pausado
    pkill -SIGUSR2 -f "^gpu-screen-recorder"
    sleep 0.2  #  para que el proceso procese la señal

    if is_paused; then
        #  reanuda
        rm -f "$PAUSED_STATE_FILE"
        pkill -RTMIN+8 waybar 2>/dev/null
    else
        #  pausado
        touch "$PAUSED_STATE_FILE"
        pkill -RTMIN+8 waybar 2>/dev/null
    fi
}


toggle_pause
exit 0
