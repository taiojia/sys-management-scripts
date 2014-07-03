#!/usr/bin/env bash

# Add 1920x1080 to VGA1
sudo xrandr --newmode $(cvt 1920 1080 60 | grep Mode | sed -e 's/.*"/1920x1080/')
sudo xrandr --addmode VGA1 1920x1080
