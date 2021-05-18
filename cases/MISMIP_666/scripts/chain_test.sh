 # Find the most recent pickup file
  
  unset -v PICKUP_FILE
  if ! ls pickup.*.data 1> /dev/null 2>&1 ; then
    echo 'job chain: fail, no pickup files'
    exit 1
  fi
  for file in pickup.*.data; do
    [[ $file -nt $PICKUP_FILE ]] && PICKUP_FILE=$file
    echo PICKUP_FILE

  done
  # Extract the middle bit of this filename
  PICKUP=${PICKUP_FILE#PChkpt_.}
  PICKUP=${PICKUP%.jld2}
