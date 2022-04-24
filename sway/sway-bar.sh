#!/usr/bin/env bash
DATE=$(date +'%A, %B %d, %Y')
TIME=$(date +'%I:%M %p')
MUSIC=$(music --swaystatus | tr -d '\n')
STATUS=$(music --status)
INSET=""

SEP="<span foreground=\"#757575\">|</span>"
JOINED_MUSIC="$MUSIC $SEP"
if [[ -z "${STATUS}" ]]; then
  JOINED_MUSIC=""
fi

echo "$JOINED_MUSIC $DATE $SEP $TIME $INSET"
