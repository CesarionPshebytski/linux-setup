#!/bin/bash
# author: Yur Tepliukh

OUTPUT=$(~/git/linux-setup/appconfig/i3/i3blocks/battery_git) 
read PERCENTAGE STATUS REMAINING_TIME <<< $OUTPUT
SHORT="$PERCENTAGE $STATUS"
COLOR=$(echo "$OUTPUT" | tail -n1)

if [[ "$1" == "short" ]]
then
  printf "%s\n%s\n%s\n" "$SHORT" "$SHORT" "$COLOR"
elif [[ "$1" == "long" ]]
then
  printf "%s %s\n%s %s\n%s\n" "$SHORT" "$REMAINING_TIME" "$SHORT" "$REMAINING_TIME" "$COLOR"
elif [ -z "$1" ]
then
  printf "%s %s\n%s\n%s\n" "$SHORT" "$REMAINING_TIME" "$SHORT" "$COLOR"
fi

if ((${PERCENTAGE%%%} < 5)) && [[ "$STATUS" == "DIS" ]]; then $(notify-send -u critical "CRITICAL LOW BATTERY!" "$PERCENTAGE REMAINING")
elif ((${PERCENTAGE%%%} < 10)) && [[ "$STATUS" == "DIS" ]]; then $(notify-send -u normal -t 60000 "LOW BATTERY!" "$PERCENTAGE REMAINING"); fi
