#!/bin/sh

if [ "$(xset q | grep Enabled | awk '{print $3}')" = "Enabled" ]; then
    xset dpms 0 0 0
    xset -dpms
    xset s 0 0
    xset s off
    xset s noblank
    touch /tmp/caffeine
    #pkill xss-lock
    #printf "SEC:3\t Caffeine Enabled\n" >$XNOTIFY_FIFO
    notify-send "Caffeine" "Caffeine enabled"
else
    xset +dpms
    xset s on #&& DISPLAY=:8 xset +dpms s oni
    xset s blank
    xset s 180 119    #&& DISPLAY=:8 xset s 180
    xset dpms 0 0 300 #&& DISPLAY=:8 xset dpms 300
    [ -f /tmp/caffeine ] && rm /tmp/caffeine

    #xss-lock -n dim-screen.sh -l -- lock &
    #printf "SEC:3\t Caffeine Disabled\n" >$XNOTIFY_FIFO
    notify-send "Caffeine" "Caffeine disabled"
fi
