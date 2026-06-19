# instalacion manual

## confiruacion waybar en `~/.config/waybar/config.jsonc`


```json

// crea modulo custom
// agregar en modulos center "custom/screenrecord-pause"
"custom/screenrecord-pause": {
  "exec": "/home/jhon/working/me/scripts/screen-recorder-pause/waybar-status-recording.sh",
  "on-click": "/home/jhon/working/me/scripts/screen-recorder-pause/screenrecord-pause-toggle.sh",
  "signal": 8,
  "return-type": "json",
  "interval": "once"
},

```

## agregar estilos en `~/.config/waybar/style.css`

```css

#custom-screenrecord-pause {
  min-width: 12px;
  margin-left: 5px;
  margin-right: 0;
  font-size: 10px;
  padding-bottom: 1px;
}

#custom-screenrecord-pause.recording {
  color: #a55555;
}

#custom-screenrecord-pause.paused {
  color: #e5a550;
}

```


## agregar permisos de ejecucion 

```sh
chmod +x screenrecord-pause-toggle.sh
chmod +x waybar-status-recording.sh

```