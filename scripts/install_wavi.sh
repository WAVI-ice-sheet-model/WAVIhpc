# Script to install wavi 

#
# choose install location (!! This will overwrite anything you have in this depot, be careful !!)
#
INSTALL_LOC=$W_ROOT/.julia
rm -rf $INSTALL_LOC
mkdir $INSTALL_LOC

#
# Go to scratch location and execute
#
cp julia_install_wavi.jl $WORK/julia_install_wavi.jl
cd $WORK
export SINGULARITYENV_JULIA_DEPOT_PATH="/opt/julia"
singularity exec -B $INSTALL_LOC:/opt/julia $IMGPATH julia julia_install_wavi.jl
rm julia_install_wavi.jl
cd $W_ROOT/scripts/
