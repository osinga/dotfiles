#!/bin/bash

osascript <<EOD
set State to false

if IsRunning("Spotify") then
	tell application "Spotify" to set State to (player state as text)
end if

if State is equal to "playing" then
	tell application "Spotify"
		return "♫ " & artist of current track & " - " & name of current track
	end tell
end if

on IsRunning(AppName)
	tell application "System Events" to (name of processes) contains AppName
end IsRunning
EOD
