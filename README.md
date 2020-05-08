# wifiman-indicator
LibIndicator support for WifiMan. Written in Vala

# Known issues:

Flickering in GNOME with KStatus/LibAppIndicator support \
and Top Icons+. We can do nothing about it. Also, the GNOME does not officially support the tray.

# Useful information:
Execute **wmindtoggle toggle** for automatic indicator startup \
**wmindtoggle start** for turning on the indicator \
**wmindtoggle stop** for turning off the indicator

# Dependencies:
First, make sure you have wifiman / wifigui installed. \
Next: \
valac (I have 0.48.5) (makedepend) \
GTK3 \
LibAppIndicator \
xdg-user-dirs \
binutils (makedepend)\
wireless-tools \
polkit

# How-to build:

**make help**

## Note for Debian users:

Before installation, make sure you executed __./debian_patch.sh__. Or, if you are maintaining this, make sure you installing with this variables: \
**PREFIX=yourdir/usr XDG_DEST=yourdir/etc/xdg/autostart PK_DEST=yourdir/usr/share/polkit-1 PK_EXEC_DEST="\\/usr\\/bin"**

# Installation:
For wifiman, **git clone https://github.com/BiteDasher/wifiman.git && cd wifiman && make && sudo make install** \
For this indicator, __make all && sudo make install && wmindtoggle start__

# HUGE Thanks to:
https://github.com/platofff for writing this stuff.

# AUR git clone link:
https://aur.archlinux.org/wifiman-indicator.git
