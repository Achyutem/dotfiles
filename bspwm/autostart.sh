#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

$HOME/.config/polybar/launch.sh &

keybLayout=$(setxkbmap -v | awk -F "+" '/symbols/ {print $2}')

#replace caplock with escape
setxkbmap -option caps:escape &
if [ $keybLayout = "be" ]; then
  run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc-azerty &
else
  run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc &
fi

feh --bg-scale ~/.config/bspwm/green.jpg &
# feh --bg-scale ~/.config/bspwm/archLinux.jpg &
redshift -P -O 4500 &
xsetroot -cursor_name left_ptr &
numlockx on &
blueberry-tray &
picom --config $HOME/.config/bspwm/picom.conf &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

