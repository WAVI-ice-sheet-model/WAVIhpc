# WAVI on ARCHER2 configuration script. Created by Alex Bradley (aleey@bas.ac.uk) on 12/5/21
#!/bin/bash

#
# set environment variables
#

export W_ROOT=$WORK/wavi/WAVIhpc
export TMPDIR=$WORK/SCRATCH
export JDEPOT=$W_ROOT/.julia
export IMGNAME="julia_container_v1_6.img"
export IMGPATH=$W_ROOT/containers/${IMGNAME}
export HECACC=n02-bas
export HOMEUSER="`whoami`"
export HOMEHOST=$HOMEUSER@bslcenb.nerc-bas.ac.uk   # alias to 'null' to disable rsync
export HOMEROOT="/data/oceans_output/shelf/`whoami`/WAVI"

#
# overwrite things with individual user exceptions
#

if [ `whoami` == "aleey" ] ; then
  #export ROOTDIR=$JDEPOT/.julia_c2
  export HECACC=n02-NES010475   # ENSOWAIS
fi


#
# aliases
#

alias cdw='cd ${W_ROOT}; pwd'
alias cdwc='cd ${W_ROOT}/cases; pwd'
alias cdws='cd ${W_ROOT}/scripts; pwd'
alias cdwu='cd ${W_ROOT}/utilities; pwd'


