#!/bin/bash

mlup="$(docker logs --since "$since" watchtower 2>&1 | tail -n 1 | grep -P '[0-9]+(?=\:[0-9]+[A-Z])')"
mdelay=2

since="$(date -I)"
since+="T00:""$mlup"+="$mdelay"":00Z"
counter="$(docker logs --since "$since" watchtower 2>&1 | grep -c "Creating")"

if [ "$counter" -eq 0 ]
        then echo "No recent updates"

        else echo "$(docker logs --since "$since" watchtower 2>&1 | grep -oP '(?<=Creating\s\/)(.*)(?=")')"

fi
