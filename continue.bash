#!/usr/bin/env bash

# This script prompts the user to press any key to continue.
#
# Reference: https://unix.stackexchange.com/questions/293940/bash-how-can-i-make-press-any-key-to-continue
# -n defines the required character count to stop reading
# -s hides the user's input
# -r causes the string to be interpreted "raw" (without considering backslash escapes)

read -n 1 -s -r -p "Press any key to continue"
