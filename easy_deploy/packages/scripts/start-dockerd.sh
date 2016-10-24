#!/bin/bash

#/**
# *　　　　 ┏┓　　 　┏┓+ +
# *　　　　┏┛┻━━━━━━━┛┻━━┓　 + +
# *　　　　┃　　　　　　 ┃ 　
# *　　　　┃━　　━　　 　┃ ++ + + +
# *　　　 ████━████      ┃+
# *　　　　┃　　　　　　 ┃ +
# *　　　　┃　┻　　　    ┃
# *　　　　┃　　　　　　 ┃ + +
# *　　　　┗━━━┓　　 　┏━┛
# *　　　　　　┃　　 　┃　　　　　　　　　　　
# *　　　　　　┃　　 　┃ + + + +
# *　　　　　　┃　　 　┃　　　　Code is far away from bug 
# *　　　　　　┃　　 　┃　　　　with the animal protecting　　　　　　　
# *　　　　　　┃　　 　┃
# *　　　　　　┃　　 　┃ + 　　　　神兽保佑,代码无bug　　
# *　　　　　　┃　　 　┃
# *　　　　　　┃　　 　┃　　+　　　　　　　　　
# *　　　　　　┃　 　　┗━━━━━━━┓ + +
# *　　　　　　┃ 　　　　　　　┣┓
# *　　　　　　┃ 　　　　　　　┏┛
# *　　　　　　┗━━┓┓┏━━━━━┳┓┏━━┛ + + + +
# *　　　　　　　 ┃┫┫　   ┃┫┫
# *　　　　　　　 ┗┻┛　   ┗┻┛+ + + +
# */

function usage {
    echo "Usage: `basename $0` <DOCKER0_IP> [PRIVATE_REGISTRY]"
}

if [ $# = 0 ]; then
    usage 
    exit -1
fi

if [ $# = 1 ]; then
    DOCKER0_IP=$1
    if [ -z $PRIVATE_REGISTRY ]; then
        echo "Error: Environment variable PRIVATE_REGISTRY must be set."
        usage
        exit -1
    fi
    #: ${PRIVATE_REGISTRY:=192.168.11.110:5000}
else
    DOCKER0_IP=$1
    PRIVATE_REGISTRY=$2
fi

cd $(cd `dirname $0`; pwd) 

#sudo ./cgroupfs-mount

sudo /usr/local/bin/dockerd \
	--insecure-registry=$PRIVATE_REGISTRY \
	--registry-mirror=http://$PRIVATE_REGISTRY \
	--registry-mirror=http://bfa45d08.m.daocloud.io \
	--bip=$DOCKER0_IP \
	-H=unix:///var/run/docker.sock \
	&
