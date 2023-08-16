#!/bin/sh

if [ "$(/sbin/mdadm -D /dev/md0 | grep -c "faulty\|degraded")" -eq 0 ]
                then {
                        (echo "Stan macierzy RAID 5:" && /sbin/mdadm -D /dev/md0) | mail -s OK -r "nextcloud@koag.pl (RAID STATUS)" osoba@example.com
                        }

                else {
                        (echo "Stan macierzy RAID 5:" && /sbin/mdadm -D /dev/md0) | mail -s FAILURE -r "nextcloud@koag.pl (RAID STATUS)" osoba1@example.com osoba2@example.com
                        }
fi
