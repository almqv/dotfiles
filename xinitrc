#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
	xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
	xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then

	xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
	xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# Keyboard layout
setxkbmap se &

# Display settings
xrandr --output DP-0 --off --output DP-1 --off --output DP-2 --primary --mode 2560x1080 --rate 143.98 --pos 0x0 --rotate normal --output DP-3 --off --output HDMI-0 --mode 1920x1080 --pos 2560x0 --rotate normal --output DP-4 --off --output DP-5 --off &

# Compositor
$HOME/.config/picom/launch &

# Background
nitrogen --restore &

# Anti sleep
exec_always xset s off &
exec_always xset -dpms &

# Loop
while true; do
	dwm > /dev/null 2>&1
done

# WM
exec dwm
