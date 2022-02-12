# interface-lammps-mlip-v2

An interface between LAMMPS and MLIP.
MLIP, Machine Learning Interatomic Potentials, is a software distributed
by the group of A. Shapeev from Skoltech (Moscow).
MLIP can be obtained by following the instructions at
https://mlip.skoltech.ru/download/.
After you have obtained MLIP you can follow the instructions below to
make the MLIP-LAMMPS interaface.

## Installation

In order to install a MLIP plugin into LAMMPS:

0. Clone MLIP-LAMMPS interface

```git clone https://gitlab.com/ashapeev/interface-lammps-mlip-2.git .```

1. Clone a version of the LAMMPS code (we recommend using a previously uncompiled version of the code) 

```git clone -b stable https://github.com/lammps/lammps.git mylammps```
 
and place it in the same folder as `interface-lammps-mlip-2/`

2. Compile `lib_mlip_interface.a` in the MLIP folder

```make libinterface```

and place it in `interface-lammps-mlip-2/`

3. Compile LAMMPS 

```./install.sh <path-to-lammps> <lammps-target>```

e.g.

```./install.sh ../mylammps intel_cpu_intelmpi```

If everything goes fine, the lammps binary will be copied to this folder

### Combination of LAMMPS and MLIP settings that work:

* MLIP with the GNU compiler and LAMMPS with `make g++_serial` 
* MLIP with the GNU compiler and mpich and LAMMPS with `make g++_mpich` 
* MLIP with Intel compiler and intel MPI and LAMMPS with `make intel_cpu_intelmpi`
* If you'd like to build with Intel and no MPI then you need to find a way to link LAMMPS with MKL
