#!/bin/bash

# SET DEBUG
set -x

# GLOBAL VARIABLES
BIN_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd)"
LIB_PATH="$BIN_PATH/lib/"
WRK_PATH="$( pwd )"

# LOAD LIBRARIES
source $LIB_PATH/functions.sh
source $LIB_PATH/help.sh

if [[ "$1" == "csr" ]];
then
	generate_csr
elif [[ "$1" == "help" ]];
then
	display_help
elif [[ -z $1 ]];
then 
	display_help
fi
