#!/bin/sh


NO_INTL=`setxkbmap -query | grep -q intl; echo $?`


if [ $NO_INTL -eq 1 ]; then
     setxkbmap -layout us -variant dvorak-intl
else
     setxkbmap -layout us -variant dvorak
fi

exit 0

