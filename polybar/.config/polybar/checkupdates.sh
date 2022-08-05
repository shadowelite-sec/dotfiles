#!/bin/bash

# Progress spin (background)
NPIPE="/tmp/.polybar-checkupdates-log"
UPDATE="checkupdates 2>/dev/null | wc -l"
# Create named pipe
if [ ! -p "/tmp/.polybar-checkupdates-log" ]; then
  mkfifo $NPIPE
fi

{
  while true
  do
    for _ in {1..7}
    do
      echo " ⠠" > $NPIPE
      sleep 0.02
      echo " ⠐" > $NPIPE
      sleep 0.02
      echo " ⠂" > $NPIPE
      sleep 0.02
      echo " ⠄" > $NPIPE
      sleep 0.02
    done
    for _ in {1..5}
    do
      echo " ⠠" > $NPIPE
      sleep 0.07
      echo " ⠐" > $NPIPE
      sleep 0.07
      echo " ⠂" > $NPIPE
      sleep 0.07
      echo " ⠄" > $NPIPE
      sleep 0.07
    done
    for _ in {1..3}
    do
      echo " ⠠" > $NPIPE
      sleep 0.1
      echo " ⠐" > $NPIPE
      sleep 0.1
      echo " ⠂" > $NPIPE
      sleep 0.1
      echo " ⠄" > $NPIPE
      sleep 0.1
    done
  done
} &

for i in {1..2}
do
	if [[ $UPDATE == 0 ]]; then
		echo "0" > $NPIPE
		kill $!
		exit
	else
		echo "$UPDATE" > $NPIPE
	fi
done





	
