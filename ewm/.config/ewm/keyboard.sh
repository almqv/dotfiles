#!/bin/bash
# Keyboard layout and repeat rate, reapplied whenever an input device is added:
# X gives a hotplugged keyboard (the Magic Keyboard reconnecting) the server
# defaults, i.e. 660 ms repeat delay and the system layout.
apply() {
	setxkbmap -model apple -layout us && xset r rate 200 40
}

apply || exit 1
udevadm monitor --udev --subsystem-match=input | while read -r _ _ action _; do
	[ "$action" = add ] || continue
	# one reconnect sends a burst of events; wait until it is quiet
	while read -r -t 1 _; do :; done
	apply || exit 0 # X is gone: the session ended
done
