#!/bin/bash

# -------- cmd_registry_install() --------
function cmd_registry_install() {
    for node in $NODES; do
        echo "-------- $node --------"
    done
}

# -------- cmd_registry_usage() --------
function cmd_registry_usage() {
    echo
    echo "Usage: $SCRIPT_NAME registry <command>"
    echo
    echo "    commands: install"
    echo
    echo "Use $SCRIPT_NAME registry <command> --help to find how to use it."
    echo
    exit 0
}

# ======== cmd_registry() ========
# 'easy_deploy registry' command entry.
function cmd_registry() {
    CMD=$1
    case $CMD in
        install)
            FUNCTION=cmd_registry_install
            ;;
        *)
            FUNCTION=cmd_registry_usage
            ;;
    esac

    ${FUNCTION} $@

}
