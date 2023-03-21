#!/usr/bin/env bash

# run gmsh on msi centos 7 using apptainer



SLOC=${BASH_SOURCE[0]}
DIR=$( dirname $SLOC )
CONTAINER=$DIR/gmsh.sif

echo $SLOC
echo $DIR
echo $CONTAINER

# allow X application to be viewed
xhost +

apptainer exec $CONTAINER /usr/bin/gmsh
