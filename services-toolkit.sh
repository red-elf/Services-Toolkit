#!/bin/bash

HERE="$(pwd)"
PATH_SOFTWARE_TOOLKIT="$HERE/Toolkit"

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

echo "Service name: $SERVICE_NAME"
echo "Service path: $SERVICE_PATH"
echo "Service generate API: $SERVICE_GENERATE_API"
echo "Service generate impl: $SERVICE_GENERATE_IMPL"

RECIPE_PATH_API="Services-Recipes/$SERVICE_RECIPE/recipe_api.sh"
RECIPE_PATH_IMPL="Services-Recipes/$SERVICE_RECIPE/recipe_impl.sh"

if ! test -e "$RECIPE_PATH_API"; then

    echo "ERROR: The '$RECIPE_PATH_API' API recipe not found at '$RECIPE_PATH_API'"
    exit 1
fi

if ! test -e "$RECIPE_PATH_IMPL"; then

    echo "ERROR: The '$RECIPE_PATH_IMPL' impl. recipe not found at '$RECIPE_PATH_IMPL'"
    exit 1
fi

echo "Service API recipe: $RECIPE_PATH_API"
echo "Service impl. recipe: $RECIPE_PATH_IMPL"

if "$SERVICE_GENERATE_API" = true; then

    PATH_API="$SERVICE_PATH/API"

    if ! test -e "$PATH_API"; then

        if ! mkdir -p "$PATH_API"; then

            echo "ERROR: Could not create '$PATH_API'"
            exit 1
        fi
    fi

    if ! sh "$RECIPE_PATH_API" "$PATH_API" "$SERVICE_NAME" "$PATH_SOFTWARE_TOOLKIT"; then

        echo "ERROR: Recipe failed '$RECIPE_PATH_API'"
        exit 1
    fi
fi

if "$SERVICE_GENERATE_IMPL" = true; then

    PATH_IMPL="$SERVICE_PATH/Impl"

    if ! test -e "$PATH_IMPL"; then

        if ! mkdir -p "$PATH_IMPL"; then

            echo "ERROR: Could not create '$PATH_IMPL'"
            exit 1
        fi
    fi

    if ! sh "$RECIPE_PATH_IMPL" "$PATH_IMPL" "$SERVICE_NAME" "$PATH_SOFTWARE_TOOLKIT"; then

        echo "ERROR: Recipe failed '$RECIPE_PATH_IMPL'"
        exit 1
    fi
fi

echo "ERROR: Services Toolkit, to be implemented"
exit 1