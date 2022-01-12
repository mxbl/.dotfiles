#!/bin/sh
xmodmap -e "keycode 64  = Super_L" # reassign Alt_L to Super_L
xmodmap -e "remove mod1 = Super_L" # make sure X keeps it out of the mod1 group
