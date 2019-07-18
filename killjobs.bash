#!/usr/bin/env bash

# This script kills all background jobs.
# Reference: https://unix.stackexchange.com/questions/43527/kill-all-background-jobs

# Debian version
# kill $(jobs -p)

# OS X version
jobs -p | xargs kill

# Gnu version
# jobs -p | xargs -rn10 kill
