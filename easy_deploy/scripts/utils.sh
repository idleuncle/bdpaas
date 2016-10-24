#!/bin/bash

cd $(cd `dirname $0`; pwd)
. ./scripts/check_env.sh

# ================ Logger ================
# 日志输出至终端且记录至syslog。
: ${CMD_LOGGER:=/usr/bin/logger} 
readonly LOGDATE=$(date "+%Y-%m-%d %H:%M:%S")
function notify() {
    MESSAGE=$@
    echo "$LOGDATE $USER@$HOSTNAME: $MESSAGE"
    $CMD_LOGGER -p info $MESSAGE
}
function error() {
    MESSAGE=$@
    echo "$LOGDATE $USER@$HOSTNAME: $MESSAGE"
    $CMD_LOGGER -p err $MESSAGE
}

