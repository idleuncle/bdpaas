#!/bin/bash


HOST_IP=192.168.11.102
ZOOKEEPER_1=192.168.11.101
ZOOKEEPER_2=192.168.11.102
ZOOKEEPER_3=192.168.11.103

docker run -d \
    --name docker-marathon \
    --net host \
    --restart always \
    -e MARATHON_HOSTNAME=${HOST_IP} \
    -e MARATHON_HTTP_ADDRESS=${HOST_IP} \
    -e MARATHON_HTTPS_ADDRESS=${HOST_IP} \
    -e MARATHON_MASTER=zk://${ZOOKEEPER_1}:2181,${ZOOKEEPER_2}:2181,${ZOOKEEPER_3}:2181/mesos \
    -e MARATHON_ZK=zk://${ZOOKEEPER_1}:2181,${ZOOKEEPER_2}:2181,${ZOOKEEPER_3}:2181/marathon \
    uu/docker-marathon 


