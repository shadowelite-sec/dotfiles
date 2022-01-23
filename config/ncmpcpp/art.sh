#!/bin/bash

# Send notification with album art when ncmpcpp plays a new song
# execute_on_song_change must be set in ncmpcpp config

MUSIC_DIR="${HOME}/Music/Library"
SONG_PATH="$(mpc --format '%file%' current)"
SONG_DIR="$(dirname "${SONG_PATH}")"
ALBUM_ART_PATH="${MUSIC_DIR}/${SONG_DIR}/cover.jpg"

if [[ ! -f "${ALBUM_ART_PATH}" ]]; then # file doesn't exist
 	ALBUM_ART_PATH="" # TODO: insert path to generic icon here
fi

notify-send -i "${ALBUM_ART_PATH}" "Now Playing" "$(mpc --format '%title% - %artist%' current)"
