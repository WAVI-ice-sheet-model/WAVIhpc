#!/usr/bin/env bash

module load hpc/julia/1.6.2

# https://unix.stackexchange.com/questions/146756/forward-sigterm-to-child-in-bash/444676#444676
prep_term()
{
    unset term_child_pid
    unset term_kill_needed
    trap 'handle_term' TERM INT
}

handle_term()
{
    if [ "${term_child_pid}" ]; then
        echo "Killing child process at `date +%F-%T`"
        kill -TERM "${term_child_pid}" 2>/dev/null

        echo -n "124" >LAST_EXIT
    else
        term_kill_needed="yes"
    fi
}

wait_term()
{
    term_child_pid=$!
    if [ "${term_kill_needed}" ]; then
        kill -TERM "${term_child_pid}" 2>/dev/null 
    fi
    wait ${term_child_pid} 2>/dev/null
    
    CHILD_EXIT=$?
    # In theory this will only exist already if handle_term has processed
    if [ ! -f LAST_EXIT ]; then
        echo "$JULIA_EXIT" >LAST_EXIT
    fi

    trap - TERM INT

    wait ${term_child_pid} 2>/dev/null

    CHILD_EXIT=$?
    # In theory this will only exist already if handle_term has processed
    if [ ! -f LAST_EXIT ]; then
        echo "$JULIA_EXIT" >LAST_EXIT
    fi
}
