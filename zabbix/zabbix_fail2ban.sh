#!/bin/sh

LASTIP_1=$(sudo /usr/bin/fail2ban-client banned | grep -oP '\b(?:(?:2(?:[0-4][0-9]|5[0-5])|[0-1]?[0-9]?[0-9])\.){3}(?:(?:2([0-4][0-9]|5[0-5])|[0-1]?[0-9]?[0-9]))\b' | tail -1)
LASTIP_2=$(sudo /usr/bin/fail2ban-client banned | grep -oP '\b(?:(?:2(?:[0-4][0-9]|5[0-5])|[0-1]?[0-9]?[0-9])\.){3}(?:(?:2([0-4][0-9]|5[0-5])|[0-1]?[0-9]?[0-9]))\b' | tail -2 | head -1)
LASTIP_3=$(sudo /usr/bin/fail2ban-client banned | grep -oP '\b(?:(?:2(?:[0-4][0-9]|5[0-5])|[0-1]?[0-9]?[0-9])\.){3}(?:(?:2([0-4][0-9]|5[0-5])|[0-1]?[0-9]?[0-9]))\b' | tail -3 | head -1)
LASTIP_4=$(sudo /usr/bin/fail2ban-client banned | grep -oP '\b(?:(?:2(?:[0-4][0-9]|5[0-5])|[0-1]?[0-9]?[0-9])\.){3}(?:(?:2([0-4][0-9]|5[0-5])|[0-1]?[0-9]?[0-9]))\b' | tail -4 | head -1)
LASTIP_5=$(sudo /usr/bin/fail2ban-client banned | grep -oP '\b(?:(?:2(?:[0-4][0-9]|5[0-5])|[0-1]?[0-9]?[0-9])\.){3}(?:(?:2([0-4][0-9]|5[0-5])|[0-1]?[0-9]?[0-9]))\b' | tail -5 | head -1)
LASTIP_6=$(sudo /usr/bin/fail2ban-client banned | grep -oP '\b(?:(?:2(?:[0-4][0-9]|5[0-5])|[0-1]?[0-9]?[0-9])\.){3}(?:(?:2([0-4][0-9]|5[0-5])|[0-1]?[0-9]?[0-9]))\b' | tail -6 | head -1)
LASTIP_7=$(sudo /usr/bin/fail2ban-client banned | grep -oP '\b(?:(?:2(?:[0-4][0-9]|5[0-5])|[0-1]?[0-9]?[0-9])\.){3}(?:(?:2([0-4][0-9]|5[0-5])|[0-1]?[0-9]?[0-9]))\b' | tail -7 | head -1)
LASTIP_8=$(sudo /usr/bin/fail2ban-client banned | grep -oP '\b(?:(?:2(?:[0-4][0-9]|5[0-5])|[0-1]?[0-9]?[0-9])\.){3}(?:(?:2([0-4][0-9]|5[0-5])|[0-1]?[0-9]?[0-9]))\b' | tail -8 | head -1)
LASTIP_9=$(sudo /usr/bin/fail2ban-client banned | grep -oP '\b(?:(?:2(?:[0-4][0-9]|5[0-5])|[0-1]?[0-9]?[0-9])\.){3}(?:(?:2([0-4][0-9]|5[0-5])|[0-1]?[0-9]?[0-9]))\b' | tail -9 | head -1)
LASTIP_10=$(sudo /usr/bin/fail2ban-client banned | grep -oP '\b(?:(?:2(?:[0-4][0-9]|5[0-5])|[0-1]?[0-9]?[0-9])\.){3}(?:(?:2([0-4][0-9]|5[0-5])|[0-1]?[0-9]?[0-9]))\b' | tail -10 | head -1)

if [ "$LASTIP_1" = "" ]
        then echo "No bans yet"
        else echo "$LASTIP_1"
fi

if [ "$LASTIP_2" != "$LASTIP_1" ]
        then echo "$LASTIP_2"
fi

if [ "$LASTIP_3" != "$LASTIP_2" ]
        then echo "$LASTIP_3"
fi

if [ "$LASTIP_4" != "$LASTIP_3" ]
        then echo "$LASTIP_4"
fi

if [ "$LASTIP_5" != "$LASTIP_4" ]
        then echo "$LASTIP_5"
fi

if [ "$LASTIP_6" != "$LASTIP_5" ]
        then echo "$LASTIP_6"
fi

if [ "$LASTIP_7" != "$LASTIP_6" ]
        then echo "$LASTIP_7"
fi

if [ "$LASTIP_8" != "$LASTIP_7" ]
        then echo "$LASTIP_8"
fi

if [ "$LASTIP_9" != "$LASTIP_8" ]
        then echo "$LASTIP_9"
fi

if [ "$LASTIP_10" != "$LASTIP_9" ]
        then echo "$LASTIP_10"
fi
