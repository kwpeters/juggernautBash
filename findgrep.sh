#!/usr/bin/env bash

# This script searches for text patterns within a set of files.
#
# The first argument is a regular expression that determines the set of files to be
# searched.
#
# The second argument is a regular expression for the text to be searched for within each
# file.

# Note: The last grep is used to colorize the output.  It is not absolutely necessary.
find . -iregex $1 -exec grep -Hin $2 {} \; 2> /dev/null | grep --color=auto -i $2
