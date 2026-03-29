#!/bin/bash

is_recording_active() {
    pgrep -f "^gpu-screen-recorder" >/dev/null
}
if ! is_recording_active; then
    rm -f /tmp/omarchy-screenrecord-paused
fi

if ! pgrep -f "^gpu-screen-recorder" >/dev/null; then
    echo '{"text": "", "class": "hidden"}'   # oculto
    exit 0
fi

if [[ -f /tmp/omarchy-screenrecord-paused ]]; then
    echo '{"text": "⏸", "class": "paused", "tooltip": "Pausado - clic para reanudar"}'
else
    echo '{"text": " ", "class": "recording", "tooltip": "Grabando - clic para pausar/detener"}'
fi


