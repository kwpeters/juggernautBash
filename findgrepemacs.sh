#!/usr/bin/env bash

# This script runs findgrep.sh and then opens the output in emacs.

findgrep.sh $1 $2 > ~/tmp/findgrepemacs.txt && emacs ~/tmp/findgrepemacs.txt