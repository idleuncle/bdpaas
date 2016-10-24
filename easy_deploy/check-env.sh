#!/bin/bash

if [ -z $PRIVATE_REGISTRY ]; then
    echo "Error: Environment PRIVATE_REGISTRY variable must be set."
    exit -1
fi

