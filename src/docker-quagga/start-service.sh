#!/bin/bash

cd $(cd `dirname $0`; pwd) && . ./config
docker run -d --name ${CONTAINER_NAME} \
    --privileged --net=host \
    -v `pwd`/config_files/etc/quagga:/etc/quagga \
    -v `pwd`/volumes/var/log/quagga:/var/log/quagga \
    uu/docker-quagga 

