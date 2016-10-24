#!/bin/bash

# 集群节点IP集合
CLUSTER_NODES= # e.g. 192.168.1.1 192.168.1.2 192.168.1.3

APPUSER=bdpaas
APPGROUP=bdpaas

function parse_config(){
    CONFIG_FILE=$1
    if [ ! -f $CONFIG_FILE ]; then
        echo "Error: $CONFIG_FILE not exist."
        exit -1
    fi
    #NODES=`cat $CONFIG_FILE | $JQ -r ".cluster.nodes" | tr -d "[" | tr -d "]" | tr -d ","`
    CLUSTER_NODES=`cat $CONFIG_FILE | $JQ -r ".cluster.nodes" | tr -d "[],\""`
    echo "Nodes in config file: " $CLUSTER_NODES
}

parse_config ./config.json

