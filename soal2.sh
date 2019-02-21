#!/bin/bash

#a
echo "---no 2a--"
awk -F , '{if($7=='2012') i[$1]+=$10} END {for(jwb in i) {print jwb}}' /home/chaniyahzm/Downloads/WA_Sales_Products_2012-14.csv | sort -nr | head -1

#b
echo "--no2b--"
awk -F , '{if($7=='2012' && $1=="United States") i[$4]+=$10} END {for(jwb in i) {print i[jwb], jwb}}' /home/chaniyahzm/Downloads/WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR<=3 {print $2,$3}'

#c
echo "--no2c--"
echo "##Personal Accesories##"
awk -F , '{if($7=='2012' && $1=="United States" && $4=="Personal Accessories") i[$6]+=$10} END {for(jwb in i) {print i[jwb], jwb}}' /home/chaniyahzm/Downloads/WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR<=3 {print $2,$3,$4}'

echo "##Camping Equipment##"
awk -F , '{if($7=='2012' && $1=="United States" && $4=="Camping Equipment") i[$6]+=$10} END {for(jwb in i) {print i[jwb], jwb}}' /home/chaniyahzm/Downloads/WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR<=3 {print $2,$3,$4}'

echo "##Outdoor Protection##"
awk -F , '{if($7=='2012' && $1=="United States" && $4=="Outdoor Protection") i[$6]+=$10} END {for(jwb in i) {print i[jwb], jwb}}' /home/chaniyahzm/Downloads/WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR<=3 {print $2,$3,$4}'

