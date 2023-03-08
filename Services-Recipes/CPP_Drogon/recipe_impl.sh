#!/bin/bash

KIND="Impl"
SCRIPT_COMMON="common.sh"

if ! test -e "$SCRIPT_COMMON"; then

    echo "ERROR: Script does not exist '$SCRIPT_COMMON'"
    exit 1
fi

if [ -z "$1" ]; then

    echo "ERROR: Path is mandatory parameter for the $KIND generating"
    exit 1
else

    PATH="$1"
fi

if [ -z "$2" ]; then

    echo "ERROR: Name of the service parameter is mandatory parameter for the $KIND generating"
    exit 1
fi

if [ -n "$3" ]; then

    PATH_SOFTWARE_TOOLKIT="$3"
fi

SERVICE_NAME="$2$SERVICE_NAME_SUFFIX"
SCRIPT_TOOLKIT_INIT="$PATH_SOFTWARE_TOOLKIT/initialize.sh"

if ! "$SCRIPT_COMMON" "$KIND" "$PATH"; then

    exit 1
fi