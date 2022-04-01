#!/usr/bin/env bash

if [ $# -lt 2 ]; then
    echo "Usage $0 <copyDest> <name>"
    exit 1
fi

DESTINATION="$1"
RUNNAME="$2"
OUTFILE="run/outfile.nc"

for DIR in ls -d ${RUNNAME}-*; do
    echo "Checking for output in $DESTINATION"

    if [ ! -f $DESTINATION/$DIR/$OUTFILE ]; then
        exit 0
    fi
done

exit 1
