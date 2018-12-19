#!/bin/bash

CURRENT_TRACK=$(osascript <<EOF
set SpotifyState to false

if AppIsRunning("Spotify") then
    tell application "Spotify" to set SpotifyState to (player state as text)
end if

if SpotifyState is equal to "playing" then
    tell application "Spotify"
        set TrackName to name of current track
        set ArtistName to artist of current track
        return "♫ " & ArtistName & " - " & TrackName & " · "
    end tell
end if

on AppIsRunning(AppName)
    tell application "System Events" to (name of processes) contains AppName
end AppIsRunning

EOF)

echo $CURRENT_TRACK
