#!/bin/sh
# reads color variables, etc. for specified files
# and alters all config files accordingly
#
# not meant for use by anyone but me

# read all colors
source $1

new_st() {
# to change st term colors
# * make a temporary .stconfig file
# * change all lines starting with "    \"#" to desired colors
# * * alternatively, read and change the 24 lines after "    /* 8 normal colors */"
# * merge temp .stconfig to .stconfig
}

new_i3() {
# to change i3 colors
# * make a temporary .i3/config file
# * change $activebar, etc. variables using sed
# * merge temp .i3/config to .i3/config
}

new_vim() {
    cat .vimrc | sed "s/colorscheme [A-Z]*[a-z]*/colorscheme $1/" > .vimrc
}
