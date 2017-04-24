#!/bin/bash
# very quick and ugly i3 theme changer script
# usage: ./change-theme.sh [themename] where themename is the name of a theme config file in the ~/.config/i3/themes directory

cd ~/.i3/

if [ -f "themes/$1" ]; then

    grep -v "^#" "themes/$1" > themeconfig

    function setting() {
        grep -oP "(?<=$1=).*" themeconfig
    }

    # clean up old theme
    rm config conky conkyrc wallpaper
    killall conky

    # copy base files
    cp base/* .
    chmod +x conky

    # replace %VARIABLE% placeholders with their values (specified in the theme config files)
    for line in $(cat themeconfig); do
        for file in config conky conkyrc; do
            sed -i "s/%${line%=*}%/${line#*=}/g" $file 2> /dev/null
        done
    done

    # change the wallpaper
    #cp "$(setting WALLPAPER)" ./wallpaper
    cp wp/$1 ./wallpaper
    feh --bg-fill ./wallpaper
    #bgs -Rz ./wallpaper

    # change the gtk theme and icons
    #gsettings set org.gnome.desktop.interface gtk-theme "$(setting GTK)"
    #gsettings set org.gnome.desktop.interface icon-theme "$(setting ICONS)"

    # restart i3
    i3-msg restart

else
    echo "no theme \"$1\" found. available themes:"
    ls themes
fi
