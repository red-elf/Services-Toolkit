#!/bin/bash

if [ -z "$1" ]; then

    echo "ERROR: Name of the service parameter is mandatory"
    exit 1
fi

if [ -z "$2" ]; then

    echo "ERROR: Installation path for the service parameter is mandatory"
    exit 1
fi

if [ -z "$3" ]; then

    echo "ERROR: Generate API parameter is mandatory"
    exit 1
else

    if "$3" = true || $3 = false; then

        SERVICE_GENERATE_API="$3"

    else

        echo "ERROR: Generate API parameter is invalid: $3"
        exit 1
    fi
fi

if [ -z "$4" ]; then

    echo "ERROR: Generate impl. parameter is mandatory"
    exit 1
else

    if "$4" = true || $4 = false; then

        SERVICE_GENERATE_IMPL="$4"

    else

        echo "ERROR: Generate impl. parameter is invalid: $4"
        exit 1
    fi
fi

if [ -z "$5" ]; then

    echo "ERROR: Installation recipe for the service is mandatory"
    exit 1
fi

SERVICE_NAME="$1"
SERVICE_PATH="$2"
SERVICE_RECIPE="$5"

if test -e "$SERVICE_PATH"; then

    echo "ERROR: directories path already exist '$SERVICE_PATH'"
    exit 1
fi

if ! test -e "$SERVICE_PATH"; then

    if mkdir -p "$SERVICE_PATH"; then

        echo "ERROR: path created '$SERVICE_PATH'"
    else

        echo "ERROR: Could not create directories path '$SERVICE_PATH'"
        exit 1
    fi
fi

echo "ERROR: Services Toolkit, to be implemented"
exit 1