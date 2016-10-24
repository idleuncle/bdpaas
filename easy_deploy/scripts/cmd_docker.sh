#!/bin/bash

# -------- cmd_docker_install() --------
function cmd_docker_install() {
    DOCKER_ENGINE_DIR="./packages/docker-engine"
    for node in $NODES; do
        echo "-------- $node --------"
        echo "scp $DOCKER_ENGINE_DIR/docker-1.12.1/* $APPUSER@$node:/usr/local/bin/"
        echo "scp $DOCKER_ENGINE_DIR/docker-compose-1.8.0/* $APPUSER@$node:/usr/local/bin/"
    done
}

# -------- cmd_docker_usage() --------
function cmd_docker_usage() {
    echo
    echo "Usage: $SCRIPT_NAME docker <command>"
    echo
    echo "    commands: install"
    echo
    echo "Use $SCRIPT_NAME docker <command> --help to find how to use it."
    echo
    exit 0
}

# ======== cmd_docker() ========
# 'easy_deploy docker' command entry.
function cmd_docker() {
    CMD=$1
    case $CMD in
        install)
            FUNCTION=cmd_docker_install
            ;;
        *)
            FUNCTION=cmd_docker_usage
            ;;
    esac

    ${FUNCTION} $@

}
