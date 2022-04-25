#!/usr/bin/env bash

set -eo pipefail

JULIAURL=${1:-"https://julialang-s3.julialang.org/bin/linux/x64/1.7/julia-1.7.2-linux-x86_64.tar.gz"}
JULIAFILENAME=`echo $JULIAURL | sed -r 's/^.+\/([^\/]+)$/\1/'`

WORKDIR=${HOME/\/home/\/work}
BINDIR=$WORKDIR/bin
BINCOMMENT='# Set up /work bin in PATH'

CWD=`pwd`

cd $WORKDIR

if ! egrep -q "$BINCOMMENT" $HOME/.bashrc; then
    echo "$BINCOMMENT in bashrc"
    echo $BINCOMMENT >> $HOME/.bashrc
    PATHMOD="export PATH=$BINDIR:\$PATH"
    echo "$PATHMOD" >> $HOME/.bashrc

    DEPOTMOD="export JULIA_DEPOT_PATH=$WORKDIR/.julia:\$JULIA_DEPOT_PATH"
    echo "$DEPOTMOD" >> $HOME/.bashrc
fi

mkdir -p bin julia

cd julia

echo "Downloading julia if required, and unpacking"
[ ! -f $JULIAFILENAME ] && wget -nv $JULIAURL -O $JULIAFILENAME

JULIADEST=`tar tvf $JULIAFILENAME | awk '{ print $6 }' | sed -n 1p`
tar xvzf $JULIAFILENAME >/dev/null

echo "Linking up the command"
ln -sf $JULIADEST current
JULIACOMMAND="$WORKDIR/julia/current/bin/julia"

cd ..

if [ ! -L "$BINDIR/julia" ]; then
    ln -s $JULIACOMMAND $BINDIR/julia
    echo "Julia now installed, you should be able to run it anywhere once you log out 
    and back in again, or source \$HOME/.bashrc"
else
    echo "Cowardly refusing to replace existing $BINDIR/julia, do it yourself!"
    echo "New julia available via: $JULIACOMMAND"
fi

exit 0
