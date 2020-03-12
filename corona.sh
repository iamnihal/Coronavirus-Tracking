#!/bin/bash
clear
JSON=$(curl -sL 'https://coronavirus-tracker-api.herokuapp.com/all')
INFECT=$(echo "$JSON" | jq -r ".latest.confirmed")
sleep 2.5
notify-send -t 10000 -i face-worried Infected:- "$INFECT"
sleep 2.5
DEATH=$(echo "$JSON" | jq -r ".latest.deaths")
notify-send -t 10000 -i face-sad Deaths:- "$DEATH"
sleep 2.5
RECOVER=$(echo "$JSON" | jq -r ".latest.recovered")
notify-send -t 10000 -i face-angel Recovered:- "$RECOVER"
#0 16 * * * /home/username/notify.sh
