#!/bin/bash

ZOOKEEPER_1=192.168.11.101
ZOOKEEPER_2=192.168.11.102
ZOOKEEPER_3=192.168.11.103

docker run -d \
    --entrypoint="mesos-slave" \
    --name docker-mesos-slave \
    -e "MESOS_CONTAINERIZERS=docker" \
    -e "MESOS_MASTER=zk://${ZOOKEEPER_1}:2181,${ZOOKEEPER_2}:2181,${ZOOKEEPER_3}:2181/mesos" \
    -e "MESOS_LOG_DIR=/var/log/mesos" \
    -e "MESOS_WORK_DIR=/var/lib/mesos" \
    -e "MESOS_LOGGING_LEVEL=INFO" \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /usr/local/bin/docker:/usr/local/bin/docker \
    uu/docker-mesos
