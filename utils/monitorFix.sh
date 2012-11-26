#!/bin/bash
echo "Enter the primary display from the following:"
xrandr --prop | grep "[^dis]connected" | cut --delimiter=" " -f1
read choice
xrandr --output $choice --primary
