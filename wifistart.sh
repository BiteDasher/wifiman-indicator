#!/usr/bin/bash
if [ $1 ]; then
case $1 in
toggle)
if [ "$(cat /etc/xdg/autostart/indicator.desktop | grep "#")" ]; then
sed -i /etc/xdg/autostart/indicator.desktop -e 's/\#\[Desktop\ Entry\]/\[Desktop\ Entry\]/g'; echo Added to autoload; else
sed -i /etc/xdg/autostart/indicator.desktop -e 's/\[Desktop\ Entry\]/\#\[Desktop\ Entry\]/g'; echo Removed from autoload; fi; exit 0
;;
start)
vindicator /tmp/signal "wifistart.sh" &>/dev/null 2>&1 & disown
exit 0
;;
stop)
killall vindicator
exit 0
;;
*)
echo "Available arguments:
toggle
start
stop"
exit 1
esac
fi
if ! [ "$(command -v wifigui)" ]; then zenity --error --title="Error" --text="WifiMan not found!"; exit 1; fi
zenity --password --title="sudo password" | sudo -S "wifigui"
