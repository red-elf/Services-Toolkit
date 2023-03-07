#!/bin/bash

KIND="API"
HERE="$(pwd)"
SERVICE_NAME_SUFFIX="-$KIND"
PATH_SOFTWARE_TOOLKIT="Toolkit"

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
SCRIPT_TOOLKIT_INIT="initialize.sh"

echo "CPP Drogon recipe, generate $KIND to '$PATH'"

if test -e "$PATH_SOFTWARE_TOOLKIT/$SCRIPT_TOOLKIT_INIT"; then

    echo "Initializing Software Toolkit"

    if cd "$PATH_SOFTWARE_TOOLKIT" && "$SCRIPT_TOOLKIT_INIT" "$PATH" "$SERVICE_NAME" && cd "$HERE"; then

        echo "Software Toolkit initialized"

    else

        echo "ERROR: Software Toolkit not initialized"
        exit 1
    fi

    # TODO: Run Upstreamable

else

    echo "ERROR: Software Toolkit initialization script not found at '$SCRIPT_TOOLKIT_INIT'"
    exit 1
fi

# TODO: Further

echo "ERROR: CPP Drogon $KIND recipe, to be implemented"
exit 1