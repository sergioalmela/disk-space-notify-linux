#!/bin/bash
#Get the percentage of space within /home partition
let NUMBER="$(df --output=pcent /home | awk -F'%' 'NR==2{print $1}')"

#Create variable file to check if notified
NOTIFIED_FILE="notified"
NOTIFIED="$(cat $NOTIFIED_FILE)"

#If disk space is equal or greather than 95%
if [ "$NUMBER" -ge 95 ]; then
	#Show warning if was not notified
	if [ "$NOTIFIED" -ne 1 ]; then
		notify-send "Your /home partition is over $NUMBER% used"
		echo 1 > $NOTIFIED_FILE
	fi
else
	echo 0 > $NOTIFIED_FILE
fi


