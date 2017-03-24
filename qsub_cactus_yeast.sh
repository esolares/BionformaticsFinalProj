#!/bin/bash
#$ -N PCHPCTest
#$ -pe openmp 32
#$ -R Y
#$ -q bio,abio,free64,free32i

#source ~/.mybashrc

module load progressiveCactus/0.0
source /data/apps/progressiveCactus/environment

#ASSEMBLYHUB="/data/users/solarese/bin/hal/hal/assemblyHub"
#ASSEMBLYHUB="/data/apps/progressiveCactus/submodules/hal/assemblyHub"
#export PATH=/data/users/solarese/bin/sonLib/bin:${PATH}
#export PATH=/data/users/solarese/bin/hal/hal/bin:${PATH}
#export PYTHONPATH=/data/users/solarese/bin/hal:$PYTHONPATH
#export PATH=${PATH}:/data/users/solarese/bin/hdf5-1.8.11/bin
#export h5prefix=-prefix=/data/users/solarese/bin/hdf5-1.8.11

runProgressiveCactus.sh --maxThreads 32 yeast.txt PCwork PCwork/yeast.hal
hal2assemblyHub.py PCwork/yeast.hal AssHub --maxThreads 32 --lod
