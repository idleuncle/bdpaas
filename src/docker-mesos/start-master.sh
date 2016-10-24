#!/bin/bash

HOST_IP=192.168.11.101
ZOOKEEPER_1=192.168.11.101
ZOOKEEPER_2=192.168.11.102
ZOOKEEPER_3=192.168.11.103

docker run --net="host" \
    -p 5050:5050 \
    --name docker-mesos-master \
    -e "MESOS_HOSTNAME=${HOST_IP}" \
    -e "MESOS_IP=${HOST_IP}" \
    -e "MESOS_ZK=zk://${ZOOKEEPER_1}:2181,${ZOOKEEPER_2}:2181,${ZOOKEEPER_3}:2181/mesos" \
    -e "MESOS_PORT=5050" \
    -e "MESOS_LOG_DIR=/var/log/mesos" \
    -e "MESOS_QUORUM=1" \
    -e "MESOS_REGISTRY=in_memory" \
    -e "MESOS_WORK_DIR=/var/lib/mesos" \
    -v `pwd`/volumes/var/log/mesos:/var/log/mesos \
    -v `pwd`/volumes/var/lib/mesos:/var/lib/mesos \
    -d \
    uu/docker-mesos
