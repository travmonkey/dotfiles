#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# source https://wiki.archlinux.org/title/Hyprland#Using_a_script_to_change_wallpaper_every_X_minutes

# This script will randomly go through the files of a directory, setting it
# up as the wallpaper at regular intervals
#
# NOTE: this script uses bash (not POSIX shell) for the RANDOM variable

pywal_refresh=$HOME/.config/hypr/scripts/RefreshNoWaybar.sh

if [[ $# -lt 1 ]] || [[ ! -d $1   ]]; then
	echo "Usage:
	$0 <dir containing images>"
	exit 1
fi

# Edit below to control the images transition
DURATION=1
BEZIER=".43,1.19,1,.4"


# This controls (in seconds) when to switch to the next image
INTERVAL=5

while true; do
	find "$1" \
		| while read -r img; do
			echo "$((RANDOM % 1000)):$img"
		done \
		| sort -n | cut -d':' -f2- \
		| while read -r img; do
        current_monitor=$(hyprctl -j activeworkspace | jq .monitor | tr -d '"')
        FPS=144
        transitions=("wipe" "any" "outer" "wave")
        rand=$[$RANDOM % ${#transitions[@]}]
        TYPE=${transitions[$rand]}
        SWWW_PARAMS="--transition-fps $FPS --transition-type $TYPE --transition-duration $DURATION"
        swww img -o $current_monitor "$img" $SWWW_PARAMS
        $pywal_refresh
        sleep $INTERVAL
			
		done
done
