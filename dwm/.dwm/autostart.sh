#!/bin/sh
xmodmap -e "keycode 64  = Super_L" # reassign Alt_L to Super_L
xmodmap -e "remove mod1 = Super_L" # make sure X keeps it out of the mod1 group

# Disable mouse Acceleration
#   (Get device id with `xinput list` or use device identifier name)
#
# Or make it persistent (need X restart):
#
# /etc/X11/xorg.conf.d/50-mouse-acceleration.conf
#   Section "InputClass"
#   	Identifier "My Mouse"
#   	Driver "libinput"
#   	MatchIsPointer "yes"
#   	Option "AccelProfile" "flat"
#   	Option "AccelSpeed" "0"
#   EndSection

xinput --set-prop 'Logitech G Pro Gaming Mouse' 'libinput Accel Profile Enabled' 0, 1
