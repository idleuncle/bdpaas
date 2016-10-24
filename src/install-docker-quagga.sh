#!/bin/bash

function usage {
	echo "Usage: `basename $0` [INSTALL_DIR=.]"
}

if [ $# = 0 ]; then
    INSTALL_ROOT=`pwd`
elif [ $# = 1 ]; then
	INSTALL_ROOT=$1
else
    usage
	exit -1
fi

PACKAGE_DIR=$(cd `dirname $0`; pwd)
INSTALL_DIR=$INSTALL_ROOT/docker-quagga

mkdir -p $INSTALL_DIR && tar zxvf $PACKAGE_DIR/docker-quagga.tar.gz -C $INSTALL_DIR

