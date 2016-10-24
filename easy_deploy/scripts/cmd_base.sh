#!/bin/bash

# -------- base_install_create_user() --------
function base_install_create_user() {
    IP=$1
    ssh root@$IP "groupadd $APPGROUP && useradd -d /home/$APPUSER -m -g $APPGROUP -s /bin/bash $APPUSER"
    if [ $? != 0 ]; then 
        exit -1
    fi
}

# -------- base_install_deploy_docker_engine() --------
function base_install_deploy_docker_engine() {
    IP=$1
}

# -------- base_install_deploy_ops_agent() --------
function base_install_deploy_ops_agent() {
    IP=$1
}

# -------- cmd_base_install() --------
function cmd_base_install() {
    for node in $NODES; do
        echo "-------- base install $node --------"
        base_install_create_user $node
        base_install_deploy_docker_engine $node
        base_install_deploy_ops_agent $node

    done
}

# -------- cmd_base_usage() --------
function cmd_docker_usage() {
    echo
    echo "Usage: $SCRIPT_NAME base <command>"
    echo
    echo "    commands: install"
    echo
    echo "Use $SCRIPT_NAME base <command> --help to find how to use it."
    echo
    exit 0
}

# ======== cmd_base() ========
# 'easy_deploy base' command entry.
function cmd_base() {
    CMD=$1
    case $CMD in
        install)
            FUNCTION=cmd_base_install
            ;;
        *)
            FUNCTION=cmd_base_usage
            ;;
    esac

    ${FUNCTION} $@

}
