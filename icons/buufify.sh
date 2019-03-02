#!/bin/bash
###########
#
# Buufify my Qubes-OS:)
# a post-install script
# by ThomG.Ha5tingerVII
# actually this only downloads a wallpaper, that's it
#
###########
# New BSD 3-Clause
# AGPL
# 1/4/2019
##########
#cd /tmp
cd /usr/share/backgrounds
sudo wget -c -O wallpaper.jpg https://pix.toile-libre.org/upload/original/1253647589.jpg
#mv wallpaper.jpg /usr/share/backgrounds
cp wallpaper.jpg ~/Pictures
# Run get-buuf.sh next to set GNOME icons
