#!/bin/bash

if [ -z "$1" ]; then

    echo "ERROR: Path is mandatory parameter for the impl. generating"
    exit 1

else

    PATH="$1"
fi

if [ -z "$2" ]; then

    echo "ERROR: Name of the service parameter is mandatory"
    exit 1
fi

SERVICE_NAME="$2-API"

echo "CPP Drogon recipe, generate impl. to '$PATH'"

# TODO

echo "ERROR: CPP Drogon impl. recipe, to be implemented"
exit 1