#!/bin/bash

set -x

KEY_DELAY=25

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
		sleep 0.045
		if [ $k == "k" ]
		then
			xdotool key --delay $KEY_DELAY --window $window Up
		elif [ $k == "m" ]
		then
                        xdotool key --delay $KEY_DELAY --window $window Left
                elif [ $k == "," ]
                then
                        xdotool key --delay $KEY_DELAY --window $window Down
                elif [ $k == "." ]
                then
                        xdotool key --delay $KEY_DELAY --window $window Right
		else
			xdotool key --delay $KEY_DELAY --window $window $k
		fi
	xdotool windowactivate $THIS
	done
done


