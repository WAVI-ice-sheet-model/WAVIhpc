# Script to install wavi 

#
# choose install location (!! This will overwrite anything you have in this depot, be careful !!)
#
INSTALL_LOC=$W_ROOT/.julia
rm -rf $INSTALL_LOC
mkdir $INSTALL_LOC

#
# Go to one up from scratch location and execute
#
mkdir -p TMPDIR 
cp julia_install_wavi.jl $TMPDIR/../julia_install_wavi.jl
cd $TMPDIR/..
export SINGULARITYENV_JULIA_DEPOT_PATH="/opt/julia"
singularity exec -B $INSTALL_LOC:/opt/julia $IMGPATH julia 
rm julia_install_wavi.jl
cd $W_ROOT/scripts/
