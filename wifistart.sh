#!/usr/bin/bash
if [ $1 ]; then 
if [ "$(cat /etc/xdg/autostart/indicator.desktop | grep "#")" ]; then
sed -i /etc/xdg/autostart/indicator.desktop -e 's/\#\[Desktop\ Entry\]/\[Desktop\ Entry\]/g'; echo Added to autoload; else
sed -i /etc/xdg/autostart/indicator.desktop -e 's/\[Desktop\ Entry\]/\#\[Desktop\ Entry\]/g'; echo Removed from autoload; fi; exit 0; fi
if ! [ "$(command -v wifigui)" ]; then zenity --error --title="Error" --text="WifiMan not found!"; exit 1; fi
zenity --password --title="sudo password" | sudo -S "wifigui"
