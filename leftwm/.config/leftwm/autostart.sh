# Keyboard layout
setxkbmap se &

# Display settings
$HOME/.screenlayout/layout.sh &

# Compositor
$HOME/.config/picom/launch &

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

# LeftWM theme
leftwm-command "LoadTheme $HOME/.config/leftwm/themes/current/theme.toml"
