#!/bin/sh

LAMMPS_PATH=..
TARGET=mpi
curdir=$(pwd)

if [ ! -f "lib_mlip_interface.a" ]; then echo Error: copy lib_mlip_interface.a to this directory.; echo "       Create it by doing make libinterface in the MLIP root folder"; exit 1; fi
if [ ! -d "$LAMMPS_PATH/src" ]; then echo Error: run ./install.sh \<path-to-lammps\> \<lammps-target\>; exit 1; fi

./preinstall.sh ..


cd $LAMMPS_PATH/src
make mpi-stubs
make -j36 mpi #intel_cpu_intelmpi
cd $curdir
cp $LAMMPS_PATH/src/lmp_$TARGET .
