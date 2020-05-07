#!/usr/bin/bash
if ! [ "$(command -v valac)" ]; then echo "valac not found" >> .tmp; berror=1; fi
if [ "$(pkg-config --exists gtk+-3.0; echo $?)" == 1 ]; then echo "GTK 3 not found" >> .tmp; berror=1; fi
if [ "$(pkg-config --exists indicator3-0.4; echo $?)" == 1 ]; then echo "libindicator not found" >> .tmp; berror=1; fi
if ! [ "$(command -v wifiman)" ]; then echo "wifiman not found" >> .tmp; berror=1; fi
if ! [ -d /etc/systemd ]; then echo "systemd not found" >> .tmp; berror=1; fi
if [ "$berror" ]; then cat .tmp; rm .tmp; else
echo "All cool"; fi
