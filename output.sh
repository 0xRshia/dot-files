#!/bin/bash

mode=""
while getopts "mh" opt; do
	case $opt in
	    m) mode="m" ;;
	    h) mode="h" ;;
	    *) echo "wrong"; exit 1 ;;
	esac
done
if [ ! -n "$mode" ]; then
	echo -e "FALIED\nplease add -m for monitor sound and -h for headphone sound"
	exit 1

fi

echo "changing output ..."

if [[ "$mode" == "m" ]]; then
	pactl set-default-sink alsa_output.pci-0000_01_00.1.hdmi-stereo
	if [ $? == 0 ]; then
		echo "changed"
		exit 1
	else
		echo "fialed"
		exit 1
	fi
elif [[ "$mode" == "h" ]]; then
	pactl set-default-sink alsa_output.pci-0000_00_1f.3.analog-stereo 
	if [ $? == 0 ]; then
		echo "changed"
		exit 1
	else
		echo "fialed"
		exit 1
	fi

fi
