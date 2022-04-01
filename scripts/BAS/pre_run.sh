#!/usr/bin/env bash

if [ $# -lt 1 ]; then
    echo "Usage pre_run <copyDest>"
    exit 1
fi

DESTINATION="$1"
OUTFILE="run/outfile.nc"

RUNID=$( basename `realpath .` )
RUNDEST="$DESTINATION/$RUNID"

if [ -d $RUNDEST ]; then
    echo "Destination $RUNDEST already exists, bailing to avoid overwrite"
    exit 1
fi

if [ -f $OUTFILE ]; then
    echo "Destination $OUTFILE already exists, bailing to avoid overwrite"
    exit 1
fi

exit 0
