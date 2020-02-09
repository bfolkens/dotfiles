#!/bin/bash

source ~/.tmux/scripts/text_roll.sh

title=$(mpc -h ~/.mpd/socket current -f "%artist% - %title%")
roll_text "${title}" 30 1
