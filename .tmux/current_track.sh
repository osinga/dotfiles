#!/bin/bash
# Source: https://www.tylerewing.co/tmux-now-playing

CURRENT_TRACK=$(osascript <<EOF
set spotify_state to false
set itunes_state to false

if is_app_running("Spotify") then
    tell application "Spotify" to set spotify_state to (player state as text)
else if is_app_running("iTunes") then
    tell application "iTunes" to set itunes_state to (player state as text)
end if

if spotify_state is equal to "playing" then
    tell application "Spotify"
        set track_name to name of current track
        set artist_name to artist of current track
        return artist_name & " - " & track_name & " | "
    end tell
else if itunes_state is equal to "playing" then
    tell application "iTunes"
        set track_name to name of current track
        set artist_name to artist of current track
        return artist_name & " - " & track_name & " | "
    end tell
end if

on is_app_running(app_name)
    tell application "System Events" to (name of processes) contains app_name
end is_app_running

EOF)

echo $CURRENT_TRACK
