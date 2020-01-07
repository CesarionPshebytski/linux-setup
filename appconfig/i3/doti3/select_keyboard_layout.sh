#!/bin/bash
# author: Yur Tepliukh
# is supposed to switch between two selected keyboard layouts

CURRENT_LAYOUT=$(setxkbmap -query | awk '/layout/{print $2}') 

if [ "$CURRENT_LAYOUT" == "$1" ]; then

  setxkbmap $2

else

  setxkbmap $1

fi
