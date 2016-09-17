#!/usr/bin/env bash

if [ "$?" = "0" ]; then
    say $1
else
    say $2
fi
