#!/bin/bash
# Get out of town if something errors
# set -e

# set -x
# xhost local:root
# export DISPLAY=:0
# $(echo mrs | sudo -S notify-send -t 5000 "I am a notification!")

HDMI_STATUS=$(echo $(xrandr --query | grep '\bHDMI-2\b' | cut -n -d " " -f 2))

if [ "$HDMI_STATUS" == "connected" ]; then
      # /home/mrs/git/linux-setup/scripts/dan_set_monitor_asus.sh
##test #{
#      MONITOR=$(echo "LAB
#PRESENTATION
#STANDALONE" | rofi -dmenu -p "Select setup:")
#      if [[ "$MONITOR" != "" ]] && [[ "$MONITOR" != "LAB" ]] && [[ "$MONITOR" != "PRESENTATION" ]] && [[ "$MONITOR" != "STANDALONE" ]]; then
#        notify-send -u low -t 1000 "Wrong choice!" -h string:x-canonical-private-synchronous:anything
#        exit
#      fi
## #}

    /usr/bin/xrandr --output HDMI-2 --above eDP-1 --auto
    echo con 
    /usr/bin/notify-send --urgency=low -t 5000 "Graphics Update" "HDMI plugged in"
 else
    /usr/bin/xrandr --output HDMI-2 --off
    /usr/bin/notify-send --urgency=low -t 5000 "Graphics Update" "External monitor disconnected"
    echo dis $DISPLAY
fi
i3-msg restart
