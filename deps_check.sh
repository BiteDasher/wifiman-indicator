#!/usr/bin/bash
if ! [ "$(command -v valac)" ]; then echo "valac not found" >> .tmp; berror=1; fi
if [ "$(pkg-config --exists gtk+-3.0; echo $?)" == 1 ]; then echo "GTK 3 not found" >> .tmp; berror=1; fi
if [ "$(pkg-config --exists indicator3-0.4; echo $?)" == 1 ]; then 
	if [ "$(pkg-config --exists indicator-0.4; echo $?)" == 1 ]; then echo "libindicator not found" >> .tmp; berror=1; fi; fi
if ! [ "$(command -v wifiman)" ]; then echo "wifiman not found" >> .tmp; berror=1; fi
if ! [ "$(command -v iwconfig)" ]; then echo "wireless-tools not found" >> .tmp; berror=1; fi
if ! [ "$(command -v strip)" ]; then echo "binutils not found" >> .tmp; berror=1; fi
if ! [ "$(command -v zenity)" ]; then echo"zenity not found" >> .tmp; berror=1; fi
if ! [ -d /etc/xdg ]; then echo "XDG-user-dirs not found" >> .tmp; berror=1; fi
if [ "$berror" ]; then cat .tmp; rm .tmp; exit 1; else
echo "All cool"; fi
