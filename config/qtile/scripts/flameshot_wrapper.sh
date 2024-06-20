#!/usr/bin/env bash

focusedwindow=$(xdotool getactivewindow)
flameshot gui --clipboard --path $HOME/Pictures/Screenshots  >/dev/null

if [ "$focusedwindow" == "$(xdotool getactivewindow)" ]
then
	xdotool windowfocus $focusedwindow
fi
