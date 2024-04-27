#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Script for Random Wallpaper ( CTRL ALT W)

wallDIR="$HOME/Pictures/wallpapers"
scriptsDir="$HOME/.config/hypr/scripts"

PICS=($(find ${wallDIR} -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.gif" \)))
RANDOMPICS=${PICS[ $RANDOM % ${#PICS[@]} ]}


# Transition config
FPS=144
transitions=("wipe" "any" "outer" "wave")
rand=$[$RANDOM % ${#transitions[@]}]
TYPE=${transitions[$rand]}
DURATION=1
BEZIER=".43,1.19,1,.4"
SWWW_PARAMS="--transition-fps $FPS --transition-type $TYPE --transition-duration $DURATION"

current_monitor=$(hyprctl -j activeworkspace | jq .monitor | tr -d '"')

swww query || swww init && swww img -o $current_monitor ${RANDOMPICS} $SWWW_PARAMS


${scriptsDir}/PywalSwww.sh
sleep 1
${scriptsDir}/RefreshNoWaybar.sh 

