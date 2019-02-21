#!/bin/bash

unzip /home/chaniyahzm/Downloads/nature.zip -d /home/chaniyahzm/Downloads
mkdir /home/chaniyahzm/Downloads/hasil1

a=0

for file in /home/chaniyahzm/Downloads/nature/*.jpg
do
	base64 -d $file | xxd -r > /home/chaniyahzm/Downloads/hasil1/$a.jpg
	a=$(($a + 1))
done
