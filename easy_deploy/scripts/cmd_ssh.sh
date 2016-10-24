#!/bin/bash

# -------- ssh_auth_host() --------
# 设置控制机与单台主机之间SSH互信
function ssh_auth_host() {
    IP=$1
    echo "ssh_auth_host() " $IP
    CMD="ssh-copy-id root@$IP"
    eval $CMD
}

# -------- cmd_ssh_auth() --------
# 设置控制机与集群所有节点之间SSH互信。
function cmd_ssh_auth(){
    for node in $NODES; do
        ssh_auth_host $node
    done;
}

# -------- cmd_ssh_list() --------
function cmd_ssh_list() {
    echo "cmd_ssh_list()" $NODES
}

# -------- cmd_ssh_usage() --------
function cmd_ssh_usage() {
    echo
    echo "Usage: $SCRIPT_NAME ssh <command>"
    echo
    echo "    commands: list"
    echo
    echo "Use $SCRIPT_NAME ssh <command> --help to find how to use it."
    echo
    exit 0
}

# ======== cmd_ssh() ========
# 'easy_deploy ssh' command entry.
function cmd_ssh(){
    CMD=$1
    case $CMD in
        list)
            FUNCTION=cmd_ssh_list
            ;;
        auth)
            FUNCTION=cmd_ssh_auth
            ;;
        *)
            FUNCTION=cmd_ssh_usage
            ;;
    esac

    ${FUNCTION} $@

}


