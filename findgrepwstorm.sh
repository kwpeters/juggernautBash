#!/usr/bin/env bash

# This script runs findgrep.sh and then opens the output in webstorm.

findgrep.sh $1 $2 > ~/tmp/findgrepemacs.txt && wstorm ~/tmp ~/tmp/findgrepemacs.txt
