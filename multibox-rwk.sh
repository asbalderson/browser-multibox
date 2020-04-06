#!/bin/bash

#set -x

WINDOWS=()

for ((i=0; i<$1; i++))
do
	echo "Select window $i"
	tmp=$(xdotool selectwindow)
	WINDOWS+=( $tmp )
done

THIS=$(xdotool getwindowfocus)

echo "all windows selected, you can freely send commands"

while [ true ] ; do
	read -n 1 k
	for window in ${WINDOWS[@]}
       	do
		xdotool windowactivate $window
		sleep 0.05
		xdotool key --window $window $k
	done
	xdotool windowactivate $THIS
done


