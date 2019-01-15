#!/usr/bin/env bash

# This script searches for text patterns within a set of files.
#
# The first argument is a regular expression that determines the set of files to
# be searched.
#
# The second argument (optional) is a regular expression for the text to be
# searched for within each file.
#
# The third argument (optional) is the number of context lines to output above
# and below each match.  If not specified, a default of 5 is used.


# Note: The last grep is used to colorize the output.  It is not absolutely
# necessary.

NUM_CONTEXT_LINES=5
if ! [ -z "$3" ]; then
    # The number of context lines was specified.
    NUM_CONTEXT_LINES=$3
fi


if [ -z "$2" ]; then
    # No text regex was specified.  We will just find file names that match.
    find . ! -path "*/node_modules/*" ! -path "*/bower_components/*" ! -path "*/.git/*" -iregex "$1" -print
else
    # Both a file name regex and a text regex were specified.
    find . ! -path "*/node_modules/*" ! -path "*/bower_components/*" ! -path "*/.git/*" -iregex "$1" -exec grep -Hin -C $NUM_CONTEXT_LINES "$2" {} \; 2> /dev/null | grep --color=auto -i -C $NUM_CONTEXT_LINES "$2"
fi
