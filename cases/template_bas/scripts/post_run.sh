#!/bin/bash

set -e

if [ -f run/outfile.nc ]; then
  CASENAME=$( basename `realpath .` )
  COPYDEST="/data/icesheet_output/${USER}/WAVIhpc"
  echo "Copying to $COPYDEST"

  rsync -avhP ../$CASENAME $COPYDEST/

  if [ $? -eq 0 ]; then
    echo "Deleting $CASENAME from `pwd`"
  fi
fi
