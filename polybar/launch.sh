#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch Polybar, using default config location 
polybar --reload mainbar-bspwm -c ~/.config/polybar/config.ini
polybar first 2>&1 | tee -a /tmp/polybar.log & disown
polybar center 2>&1 | tee -a /tmp/polybar.log & disown
polybar right 2>&1 | tee -a /tmp/polybar.log & disown
~/.config/polybar/scripts/nowPlayingLauncher.sh & disown

echo "Polybar launched..."
