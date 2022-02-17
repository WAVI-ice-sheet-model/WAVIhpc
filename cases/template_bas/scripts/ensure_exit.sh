#!/usr/bin/env bash

# This is to protect against NODE_FAIL or similar scenarios that kill run_ensemble_member
# prior to producing a status file. If that happens, subsequent runs will assume it's not 
# a pickup of a previous job and reinitialise the run directory, scrubbing valid output :(

if [ ! -f run/LAST_EXIT ]; then
    echo "1" >run/LAST_EXIT
fi

exit 0
