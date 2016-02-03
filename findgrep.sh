#!/usr/bin/env bash

# This script searches for text patterns within a set of files.
#
# The first argument is a regular expression that determines the set of files to be
# searched.
#
# The second argument is a regular expression for the text to be searched for within each
# file.

# Note: The last grep is used to colorize the output.  It is not absolutely necessary.


if [ -z "$2" ]; then
    # No text regex was specified.  We will just find file names that match.
    find . -iregex $1 -print
else
    # Both a file name regex and a text regex were specified.
    find . -iregex $1 -exec grep -Hin -C 5 $2 {} \; 2> /dev/null | grep --color=auto -i -C 5 $2
fi
