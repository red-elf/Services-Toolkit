#!/bin/bash

if [ -z "$1" ]; then

    echo "ERROR: Generate API parameter is mandatory"
    exit 1
else

    if "$1" = true || $1 = false; then

        SERVICE_GENERATE_API="$1"

    else

        echo "ERROR: Generate API parameter is invalid: $1"
        exit 1
    fi
fi

if [ -z "$2" ]; then

    echo "ERROR: Generate impl. parameter is mandatory"
    exit 1
else

    if "$2" = true || $2 = false; then

        SERVICE_GENERATE_IMPL="$2"

    else

        echo "ERROR: Generate impl. parameter is invalid: $2"
        exit 1
    fi
fi

if "$SERVICE_GENERATE_API" = true; then

    echo "CPP Drogon recipe: Generate API"

    # TODO
fi

if "$SERVICE_GENERATE_IMPL" = true; then

    echo "CPP Drogon recipe: Generate Impl."

    # TODO
fi

echo "ERROR: CPP Drogon recipe, to be implemented"
exit 1