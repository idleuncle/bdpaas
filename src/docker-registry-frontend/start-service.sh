#!/bin/bash

cd $(cd `dirname $0`; pwd) && . ./config

docker run -d \
    --name ${CONTAINER_NAME} \
    -p 8080:80 \
    -e ENV_DOCKER_REGISTRY_HOST=$ENV_DOCKER_REGISTRY_HOST \
    -e ENV_DOCKER_REGISTRY_PORT=$ENV_DOCKER_REGISTRY_PORT \
    konradkleine/docker-registry-frontend:v2
