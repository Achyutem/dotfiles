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
if [ $keybLayout = "be" ]; then
  run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc-azerty &
else
  run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc &
fi

setxkbmap -option caps:escape &
feh --bg-scale ~/.config/bspwm/green.jpg &
redshift -P -O 4500 &
xsetroot -cursor_name left_ptr &
numlockx on &
blueberry-tray &
picom --config $HOME/.config/bspwm/picom.conf &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
firefox &
