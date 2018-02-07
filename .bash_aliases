#!/bin/bash

    alias ytdl="youtube-dl -o \"%(title)s.%(ext)s\""
    alias exot="exit"
    alias reload=". ~/.profile"
    #alias trash="trash -v"
    #alias boston_weather="weather -i 4930956"
    alias lsblk="lsblk -o NAME,SIZE,TYPE,MOUNTPOINT,UUID"
    alias ls="ls --color=auto"
    #alias vi="vim"
    alias calc="bc -l <<<"
    #alias profanity="torify profanity"
    alias :q="exit" # cuz vim has taken over my hands
    alias screenfetch="clear; screenfetch 2>/dev/null"
    alias ..="cd .."
    alias python="python3"
    alias start="startx"
    alias battery="upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep percent | awk -F ' ' '{print }'"
