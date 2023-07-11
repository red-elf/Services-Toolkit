#!/bin/bash

INSTALL_RECIPE() {

    if [ -z "$1" ]; then

        echo "ERROR: $KIND parameter is manadtory for the recipe"
        exit 1
    else

        KIND="$1"
    fi

    SERVICE_NAME_SUFFIX="-$KIND"
    PATH_SOFTWARE_TOOLKIT="Toolkit"
    PATH_UPSTREAMABLE="Upstreamable"

    if [ -z "$2" ]; then

        echo "ERROR: Path is mandatory parameter for the $KIND generating"
        exit 1
    else

        PATH="$2"
    fi

    if [ -z "$3" ]; then

        echo "ERROR: Name of the service parameter is mandatory parameter for the $KIND generating"
        exit 1
    fi

    if [ -n "$4" ]; then

        PATH_SOFTWARE_TOOLKIT="$4"
    fi

    if [ -n "$5" ]; then

        PATH_UPSTREAMABLE="$5"    
    fi

    SERVICE_NAME="$3$SERVICE_NAME_SUFFIX"
    SCRIPT_TOOLKIT_INIT="$PATH_SOFTWARE_TOOLKIT/initialize.sh"
    SCRIPT_UPSTREAMS_INIT="$PATH_UPSTREAMABLE/install_upstreams.sh"

    echo "CPP Drogon recipe, generate $KIND to '$PATH'"

    if test -e "$SCRIPT_TOOLKIT_INIT"; then

        echo "Initializing Software Toolkit"

        if "$SCRIPT_TOOLKIT_INIT" "$PATH" "$SERVICE_NAME"; then

            echo "Software Toolkit initialized"

        else

            echo "ERROR: Software Toolkit not initialized"
            exit 1
        fi

    else

        echo "ERROR: Software Toolkit initialization script not found at '$SCRIPT_TOOLKIT_INIT'"
        exit 1
    fi
}