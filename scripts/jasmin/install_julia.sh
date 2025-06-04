#!/usr/bin/env bash

set -eo pipefail

JULIAURL=${1:-"https://julialang-s3.julialang.org/bin/linux/x64/1.11/julia-1.11.5-linux-x86_64.tar.gz"}
JULIAFILENAME=`echo $JULIAURL | sed -r 's/^.+\/([^\/]+)$/\1/'`
JULIAVERSION=`echo $JULIAFILENAME | sed -E 's/-linux.*//'`
WORKDIR="/gws/nopw/j04/dit/users/$USER"
BIN_DIR=$WORKDIR/$JULIAVERSION/bin

cd $WORKDIR

# Dowload and unpack Julia
echo "Downloading julia, if required"
[ ! -f $JULIAFILENAME ] && wget -nv $JULIAURL -O $JULIAFILENAME

echo "Unpacking $JULIAFILENAME, this might take a while"
tar xvzf $JULIAFILENAME >/dev/null

# Cleaning up tar file
echo "Cleaning up tar file"
rm $JULIAFILENAME

# Add Julia to PATH (example for bash)
echo 'export PATH="$BIN_DIR:$PATH"' >> ~/.bashrc
source ~/.bashrc

echo "Julia now installed, you should be able to run it"
