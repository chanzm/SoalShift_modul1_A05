#!/bin/bash
iter=1
psno=1
while [ $iter -ne 0 ]
do
if [[ -f /home/chaniyahzm/hasil3/password$psno.txt ]] ; then
    psno=$((psno + 1))
    else
cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1 > /home/chaniyahzm/hasil3/password$psno.txt
iter=0
fi
done
