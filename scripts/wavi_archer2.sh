# WAVI on ARCHER2 configuration script. Created by Alex Bradley (aleey@bas.ac.uk) on 12/5/21 for ARCHER4cabinet system. Updated by Alex Bradley for ARCHER2 full system on 18/01/22
#!/bin/bash

#
# set environment variables
#

export W_ROOT=$WORK/wavi/WAVIhpc
export W_CASES=$W_ROOT/cases/     #for binding to singularity at run time
export MNT_CASES=/mnt/lustre/a2fs-work2/$W_CASES/ #fix by David Bett (davbet33@bas.ac.uk) for ARCHER2 bind mount problems
export TMPDIR=$WORK/SCRATCH
export JDEPOT=$W_ROOT/.julia
export IMGNAME="julia_container_v1_6.img"
export IMGPATH=$W_ROOT/containers/${IMGNAME}
export HECACC=n02-bas
export HOMEUSER="`whoami`"
export W_HOMEHOST=$HOMEUSER@bslcenb.nerc-bas.ac.uk   # alias to 'null' to disable rsync
export W_HOMEROOT="/data/icesheet_output/`whoami`/wavi"

#
# overwrite things with individual user exceptions
#

if [ `whoami` == "aleey" ] ; then
  #export ROOTDIR=$JDEPOT/.julia_c2
  export HECACC=n02-NES010475   # ENSOWAIS
fi

if [ `whoami` == "chll1" ] ; then
  export HECACC=n02-NES010475   # ENSOWAIS
fi

#
# aliases
#

alias cdw='cd ${W_ROOT}; pwd'
alias cdwc='cd ${W_ROOT}/cases; pwd'
alias cdws='cd ${W_ROOT}/scripts; pwd'
alias cdwu='cd ${W_ROOT}/utilities; pwd'

#
# path variables
#
export PATH=${PATH}:$W_ROOT/scripts

