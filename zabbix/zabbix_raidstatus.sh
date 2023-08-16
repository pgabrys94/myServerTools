#!/bin/sh

RAIDSTATUS=null

if [ "$(sudo /sbin/mdadm -D /dev/md0 | grep -c "faulty\|degraded")" -gt 0 ]
        then RAIDSTATUS="FAILURE"
        elif [ "$(sudo /sbin/mdadm -D /dev/md0 | grep -c "resyncing\|recovering")" -gt 0 ]
                then RAIDSTATUS="RESYNCING"
                elif [ "$(sudo /sbin/mdadm -D /dev/md0 | grep -c "clean")" -gt 0 ]
                        then RAIDSTATUS="OK"
fi
echo $RAIDSTATUS
