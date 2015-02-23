#!/bin/sh

echo -n "Y " \
 | convert -extract 16x16+43+43 -background  lightblue  -fill blue  -pointsize 21 text:-  bmp3:- \
 | dd bs=1 skip=54 \
 | nc -u 172.22.239.182 8888
