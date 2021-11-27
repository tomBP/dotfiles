#!/usr/bin/env bash

# INSTALL SCRIPT
# Tom Bowlby Pearson 2016

# Include utils
source utils.sh


# Constants
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PARENT=$(dirname "$DIR")
WORK_DIR=$HOME/work
GIT_DIR=$WORK_DIR/git
INTELLIJ_DIR=$WORK_DIR/intellij
APP_DIR=/usr/share/applications

softLink "$PARENT"/vim/.vim "$HOME"

# Finish successfully
exit

