#!/bin/bash

if [ $# = 0 ]; then
	echo "Usage: $0 <MYID> [INSTALL_DIR=.]"
	exit -1
elif [ $# = 1 ]; then
	MYID=$1	
	INSTALL_ROOT=`pwd`
else
	MYID=$1
	INSTALL_ROOT=$2
fi

PACKAGE_DIR=$(cd `dirname $0`; pwd)
INSTALL_DIR=$INSTALL_ROOT/zookeeper_$MYID

mkdir -p $INSTALL_DIR && tar zxvf $PACKAGE_DIR/docker-zookeeper.tar.gz -C $INSTALL_DIR

sed -i -r "s/MYID=.*/MYID=${MYID}/g" $INSTALL_DIR/config
