#!/bin/bash

if [ $# != 1 ]; then
    echo "Usage: `basename $0` <IMAGE>"
    exit -1
fi

if [ -z ${PRIVATE_REGISTRY} ]; then
    echo "Error: Environment variable PRIVATE_REGISTRY must by set."
    exit -1
fi

IMAGE=$1
PRIVATE_IMAGE=$PRIVATE_REGISTRY/$IMAGE

echo "Pulling PRIVATE_IMAGE $PRIVATE_IMAGE"

docker pull $PRIVATE_IMAGE && \
docker tag $PRIVATE_IMAGE $IMAGE && \
docker rmi $PRIVATE_IMAGE
