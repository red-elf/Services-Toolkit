#!/bin/bash

SERVICE_NAME_SUFFIX="-API"
SCRIPT_TOOLKIT_INIT="initialize.sh"

if [ -z "$1" ]; then

    echo "ERROR: Path is mandatory parameter for the API generating"
    exit 1

else

    PATH="$1"
fi

if [ -z "$2" ]; then

    echo "ERROR: Name of the service parameter is mandatory"
    exit 1
fi

SERVICE_NAME="$2$SERVICE_NAME_SUFFIX"

echo "CPP Drogon recipe, generate API to '$PATH'"

if ! test -e "$SCRIPT_TOOLKIT_INIT"; then

    echo "ERROR: Software Toolkit initialization script not found at '$SCRIPT_TOOLKIT_INIT'"
    exit 1
fi

echo "Initializing Software Toolkit"

if sh "$SCRIPT_TOOLKIT_INIT" "$PATH" "$SERVICE_NAME"; then

    echo "Software Toolkit initialized"

else

    echo "ERROR: Software Toolkit not initialized"
    exit 1
fi

# TODO

echo "ERROR: CPP Drogon API recipe, to be implemented"
exit 1