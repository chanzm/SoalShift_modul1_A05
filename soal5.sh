#!/bin/bash

awk '/cron/ || /CRON/,!/sudo/' /var/log/syslog |awk 'NF < 13' > /home/faqih/modul1/syslog.log
