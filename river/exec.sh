#!/usr/bin/env bash

# *** Exec Commands ***

# Env variables
systemctl --user import-environment DISPLAY WAYLAND_DISPLAY &

# Notifications
mako &

# Flux/Redshift alternative
source ../wlsunset/location.sh # Don't dox me
wlsunset -l $lat -L $long &

# Wallpaper
swaybg --image ~/Pictures/Desktop/background.jpg -m fill &

# Bar
waybar -b bar &

# Wayland display management (Scaling, etc)
way-displays >/tmp/way-displays."${XDG_VTNR}"."${USER}".log 2>&1 &

# Monitor and keyboard backlight adjustment
# brillo -lS 5 & # Screen backlight
brillo -kS 5 & # Keyboard backlight
