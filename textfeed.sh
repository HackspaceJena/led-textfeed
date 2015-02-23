#!/bin/sh

HOST="172.22.239.182"
PORT=8888
NC=$(which nc)

DEBUG=0
MESSAGE="Z"

MESSAGE="$MESSAGE "
if [ "$DEBUG" = 0 ]; then
 echo -n "$MESSAGE" \
  | convert -extract 16x16+43+43 -background  lightblue  -fill blue  -pointsize 21 text:-  bmp3:- \
  | dd bs=1 skip=54 \
  | "$NC" -u "$HOST" "$PORT"
else
 echo -n "$MESSAGE" \
  | convert -extract 16x16+43+43 -background  lightblue  -fill blue  -pointsize 21 text:-  bmp3:- \
  > /tmp/debug.bmp
 gpicview /tmp/debug.bmp
fi

