#!/usr/bin/bash

WM_CHECK=$(wmctrl -m | grep Name | cut -d: -f2 | sed 's/ //g')

if [ "$WM_CHECK" != "LeftWM" ]; then
	echo "Not LEFTWM, ignoring..."
	exit 0
else
	echo "OK"
fi


# Keyboard layout
setxkbmap se &

# Display settings
sh $HOME/.screenlayout/layout.sh &

# Compositor
sh $HOME/.config/picom/launch &

# Background
nitrogen --restore &

# Notification daemon
dunst &

# Anti sleep
xset s off &
xset -dpms &

# EWW widgets etc
#eww daemon
#eww open bar

# Polybar
# $HOME/.config/polybar/launch &

# EWW widgets
eww daemon &
eww open-many bar-1 bar-2 & # the bar

# Keyring
eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

# Emacs daemon
# emacs --daemon &
