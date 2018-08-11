#!/bin/bash
# Source: https://www.tylerewing.co/tmux-now-playing

CURRENT_TRACK=$(osascript <<EOF
set spotifyState to false

if appIsRunning("Spotify") then
    tell application "Spotify" to set spotifyState to (player state as text)
end if

if spotifyState is equal to "playing" then
    tell application "Spotify"
        set trackName to name of current track
        set artistName to artist of current track
        return artistName & " - " & trackName & " · "
    end tell
end if

on appIsRunning(appName)
    tell application "System Events" to (name of processes) contains appName
end appIsRunning

EOF)

echo $CURRENT_TRACK
