#!/bin/bash

hour=`date +"%H"`
name=`date +"%H:%M %d-%m-%y"`

kcl="abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
bsr="ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ"

awk '{print}' /var/log/syslog | tr "${kcl:0:26}${bsr:0:26}" "${kcl:$hour:26}${bsr:$hour:26}" > "/home/chaniyahzm/hasil4_enk/$name"
