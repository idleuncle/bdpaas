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

docker tag ${IMAGE} ${PRIVATE_REGISTRY}/${IMAGE}
docker push ${PRIVATE_REGISTRY}/${IMAGE}
docker rmi ${PRIVATE_REGISTRY}/${IMAGE}

