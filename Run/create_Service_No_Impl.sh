#!/bin/bash

SCRIPT_TOOLKIT="services-toolkit.sh"

if ! test -e "$SCRIPT_TOOLKIT"; then

    echo "ERROR: Script not found '$SCRIPT_TOOLKIT'"
    exit 1
fi

sh "$SCRIPT_TOOLKIT" "TestService" ~/Documents/Temp/Test_Modules/Tmp_API true false CPP_Drogon