# Aliases
    [ -f ./.bash_aliases ] && source ./.bash_aliases

# Import prompt colors
    [ -f ./.bash_color_codes ] && source ./.bash_color_codes

# Startup Message
    echo -e "login by ${bldred}$(whoami|tr -d '\n'; echo -n) ${txtrst}on ${bldblu}$(date) ${txtrst}from ${bldgrn}$(tty)${txtrst}"
    
# The following are user prompt settings
    # prompt is "username@host workspace $ ". uncomment to use.
    #PS1="\u@\h \w \$ "

    # prompt is "username workspace $ ". uncomment to use.
    #PS1="\u \w \$ "

    # prompt is "lord username orders you to ". uncomment to use.
    #PS1="lord \u orders you to "
	
    # prompt is "lord username [workspace] $ ". uncomment to use.
    #PS1="lord \u [\w] \$ "

    # prompt is "[cmd] workspace $ "
    #PS1="[‎cmd #\#] \w \$ "

    # ercas's prompt
    #PS1="[#\#][\w]\$ "

    # femme prompt
    PS1="\[$bldpur\]\u\[$txtrst\]@\[$bldred\]\h \[$bldblu\]\w \[$txtpur\]♀ \[$txtrst\]"

# Miscellaneous functions

    # quick reference for tar functions
    function tarhelp()
    {
        cat <<EOF
Extracting files...
  file.tar:      tar -xvf /path/to/file.tar -C /path/to/output/
  file.tar.gz:   tar -zxvf /path/to/file.tar.gz -C /path/to/output/
  file.tar.bz2:  tar -jxvf /path/to/file.tar.bz2 -C /path/to/output/
  specific file: tar -tags /path/to/file.type specific.filetype -C /path/to/output/

Compressing files...
  file.tar:      tar -cvf filename.tar /path/to/directory/
  file.tar.gz:   tar -zcvf filename.tar.gz /path/to/directory/
  file.tar.bz2:  tar -jcvf filename.tar.bz2 /path/to/directory/
EOF
    }

    # cp the file into the designated directory, making any necessary
    # directories along the way
    function mkcp() 
    {
        mkdir -p "$2"
        cp "$1" "$2"
    }

    # cd into a directory, then print its contents
    function cdls()
    {
        cd "$1"
        ls
    }

    # makes a directory then navigates into it
    function mkcd()
    {
        mkdir -p "$1"
        cd "$1"
    }

    # returns a random number between a given minimum and maximum
    function random()
    {
        echo $RANDOM % $[$2-$1+1] + $1 | bc
    }

    # does a function $1 times
    function x()
    {
        i=$(seq $1)
        shift 1
        for num in $i; do
            $@
            sleep .05s
        done
    }

    # prints out a cute little space invaders-themed scene, showing off the terminal colors
    function invaders() {
        f=3 b=4
        for j in f b; do
            for i in {0..7}; do
                printf -v $j$i %b "\e[${!j}${i}m"
            done
        done
        bld=$'\e[1m'
        rst=$'\e[0m'

        printf "
 $f1  ▀▄   ▄▀     $f2 ▄▄▄████▄▄▄    $f3  ▄██▄     $f4  ▀▄   ▄▀     $f5 ▄▄▄████▄▄▄    $f6  ▄██▄  $rst
 $f1 ▄█▀███▀█▄    $f2███▀▀██▀▀███   $f3▄█▀██▀█▄   $f4 ▄█▀███▀█▄    $f5███▀▀██▀▀███   $f6▄█▀██▀█▄$rst
 $f1█▀███████▀█   $f2▀▀███▀▀███▀▀   $f3▀█▀██▀█▀   $f4█▀███████▀█   $f5▀▀███▀▀███▀▀   $f6▀█▀██▀█▀$rst
 $f1▀ ▀▄▄ ▄▄▀ ▀   $f2 ▀█▄ ▀▀ ▄█▀    $f3▀▄    ▄▀   $f4▀ ▀▄▄ ▄▄▀ ▀   $f5 ▀█▄ ▀▀ ▄█▀    $f6▀▄    ▄▀$rst
 $bld$f1▄ ▀▄   ▄▀ ▄   $f2 ▄▄▄████▄▄▄    $f3  ▄██▄     $f4▄ ▀▄   ▄▀ ▄   $f5 ▄▄▄████▄▄▄    $f6  ▄██▄  $rst
 $bld$f1█▄█▀███▀█▄█   $f2███▀▀██▀▀███   $f3▄█▀██▀█▄   $f4█▄█▀███▀█▄█   $f5███▀▀██▀▀███   $f6▄█▀██▀█▄$rst
 $bld$f1▀█████████▀   $f2▀▀▀██▀▀██▀▀▀   $f3▀▀█▀▀█▀▀   $f4▀█████████▀   $f5▀▀▀██▀▀██▀▀▀   $f6▀▀█▀▀█▀▀$rst
 $bld$f1 ▄▀     ▀▄    $f2▄▄▀▀ ▀▀ ▀▀▄▄   $f3▄▀▄▀▀▄▀▄   $f4 ▄▀     ▀▄    $f5▄▄▀▀ ▀▀ ▀▀▄▄   $f6▄▀▄▀▀▄▀▄$rst
                                     $f7▌$rst
                                   $f7▌$rst
                              $f7    ▄█▄    $rst
                              $f7▄█████████▄$rst
                              $f7▀▀▀▀▀▀▀▀▀▀▀$rst
"
    }

    # list most used commands
    # from http://www.commandlinefu.com/commands/view/604/list-of-commands-you-use-most-often
    function topcmds() {
        history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
    }

    # wget zipped github-hosted source files from repo $2 hosted by user $1
    function git-get () {
        wget "https://github.com/$1/$2/archive/master.zip" -O "$2-git.zip"
    }

    # play Star Wars Episode IV: A New Hope in the terminal over telnet
    function star-wars() {
        telnet towel.blinkenlights.nl
    }
    
    # opens a blank scratchpad that's removed when vim exits if vim has
    # no arguments
    function vim() {
        if [ -z "$@" ]; then
            /usr/bin/vim /tmp/scratch
            rm -rf /tmp/scratch
        else
            /usr/bin/vim $@
        fi
    }

# -- coloured manuals
man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;40;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;34m") \
	man "$@"
}

# Environment Variables
    # to allow weston to launch
    export XDG_RUNTIME_DIR=/tmp
    # lynx starting page
    export WWW_HOME="www.duckduckgo.com"
    # terminal, ofc
    export TERM=xterm
    # editor
    export VISUAL=vim
    # vi instead of emacs cmdline editing
    #set -o vi

# Startup Programs
    if tty | grep -q tty1; then
        # keeps any programs from creating a ~/Desktop directory
        if ! ps aux | grep -v "grep" | grep -q "noDesktopd"; then
            if [ -f "$HOME/bin/noDesktopd" ]; then
                bash $HOME/bin/noDesktopd &
            fi
        fi
        # similar to noDesktopd, but with ~/Downloads
        if ! ps aux | grep -v "grep" | grep -q "noDownloadsd"; then
            if [ -f "$HOME/bin/noDownloadsd" ]; then
                bash $HOME/bin/noDownloadsd &
            fi
        fi
        # sets brightness to 7, of course
        #if ps aux | grep -v "grep" | grep -q "logbrightnessd"; then
            bash brightness 5
        #fi
    fi
