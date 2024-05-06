#!/bin/bash

# Directory for icons
iDIR="$HOME/.config/swaync/icons"

# Note: You can add more options below with the following format:
# ["TITLE"]="link"

# Define menu options as an associative array
declare -A menu_options=(
  ["Lofi Girl ☕️🎶"]="https://play.streamafrica.net/lofiradio"
  ["Ghibli Music 🎻🎶"]="https://youtube.com/playlist?list=PLNi74S754EXbrzw-IzVhpeAaMISNrzfUy&si=rqnXCZU5xoFhxfOl"
  ["Anime OP Lofi ☕️🎶"]="https://www.youtube.com/playlist?list=PLl578ZPbYIlFcSxuka8Km37VgbUYUWI5p"
  ["Video Game 🎮🎶"]="https://www.youtube.com/playlist?list=PLK5w70ndndYOm75Fdsc2169PXGU--qvjJ"
  ["Elden Ring 🗡️🎶"]="https://www.youtube.com/playlist?list=PLlHY6e7WCV6OaT4dPnFIv_gcL2tqEQT4c"
  ["Dark Souls 3 🗡️🎶"]="https://www.youtube.com/playlist?list=PLlHY6e7WCV6M7UV1EBjAFA349aTyutIU4"
  ["Hollow Knight ♞🎶"]="https://www.youtube.com/playlist?list=PLlHY6e7WCV6NxghzG-7CxbMRu8UEja91b"
  ["Persona 5 🃏🎶"]="https://www.youtube.com/playlist?list=OLAK5uy_nCEOviuThU9V0LgO4UVybwNc9qZb-SlIs"
)

# Function for displaying notifications
notification() {
  notify-send -u normal -i "$iDIR/music.png" "Playing now: $@"
}

# Main function
main() {
  choice=$(printf "%s\n" "${!menu_options[@]}" | rofi -dmenu -config ~/.config/rofi/themes/config-rofi-Beats.rasi -i -p "")

  if [ -z "$choice" ]; then
    exit 1
  fi

  link="${menu_options[$choice]}"

  notification "$choice"
  
  # Check if the link is a playlist
  if [[ $link == *playlist* ]]; then
    mpv --shuffle --vid=no "$link"
  else
    mpv "$link"
  fi
}

# Check if an online music process is running and send a notification, otherwise run the main function
pkill mpv && notify-send -u low -i "$iDIR/music.png" "Online Music stopped" || main
