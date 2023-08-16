#!/bin/bash

since="$(date -I)"
since+="T00:00:00Z"
counter="$(docker logs --since "$since" watchtower 2>&1 | grep -c "Creating")"
ecounter="$counter"
container=0
pos=0

if [ "$counter" -eq 0 ]
        then echo "No recent updates"
else {

        while [ "$counter" -ne 0 ]; do
                ((++pos))

        declare "container[$pos]"="$(docker logs --since "$since" watchtower 2>&1 | grep -oP '(?<=Creating\s\/)(.*)(?=")' | tail -n "$counter" | head -1 )"

                ((counter--))
        done

        while [ "$ecounter" -ne 0 ]; do

                echo "${container["$ecounter"]}"

                ((ecounter--))
        done
} fi
