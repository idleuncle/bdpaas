#!/bin/bash

JQ=`which jq`
if [ -z $JQ ]; then
    echo "Error: jq not found. Install it first(e.g. apt-get install jq)."
    exit -1
fi

