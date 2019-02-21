#!/bin/bash

#--dekript no4--

echo "Input nama file yang ingin di decrypt = "
read inputtime
hour=${inputtime:0:2}

kcl="abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
bsr="ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ"

awk '{print}' "/home/chaniyahzm/hasil4_enk/$inputtime" | tr "${kcl:$hour:26}${bsr:$hour:26}" "${kcl:0:26}${bsr:0:26}" | awk '{print}'
