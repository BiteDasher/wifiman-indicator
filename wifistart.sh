#!/usr/bin/bash
if ! [ "$(command -v wifigui)" ]; then zenity --error --title="Error" --text="WifiMan not found!"; exit 1; fi
zenity --password --title="sudo password" | sudo -S "wifigui"
