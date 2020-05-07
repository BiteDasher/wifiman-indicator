# wifiman-indicator
LibIndicator support for WifiMan. Written in Vala

# Known issues:

Flickering in GNOME with KStatus/LibAppIndicator support \
and Top Icons+. We can do nothing about it. Also, the GNOME does not officially support the tray.

# Dependencies:
First, make sure you have wifiman / wifigui installed. \
Next: \
valac (I have 0.48.5) (only for compiling) \
GTK3 \
LibAppIndicator \
zenity \
systemd \
binutils (only for compiling)\
wireless-tools

# How-to build:

**make help**

# Installation:
For wifiman, **git clone https://github.com/BiteDasher/wifiman.git && cd wifiman && make && sudo make install** \
For this indicator, __make all && sudo make install && ./dist_install.sh__

# HUGE Thanks to:
https://github.com/platofff for writing this stuff.

# AUR git clone link:
https://aur.archlinux.org/wifiman-indicator.git
