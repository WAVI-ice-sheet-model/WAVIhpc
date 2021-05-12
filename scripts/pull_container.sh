#Script to pull the julia container. Created by Alex Bradley (aleey@bas.ac.uk) on 12/05/2021

IMAGE_NAME=julia_container_v1_6.img
singularity pull --name $IMAGE_NAME docker://julia:1.6
mv $IMAGE_NAME $W_ROOT/containers/.
