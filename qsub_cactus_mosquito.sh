#!/bin/bash
#$ -N PCMosqutioTest
#$ -pe openmp 64
#$ -R Y
#$ -q bio,abio

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

runProgressiveCactus.sh --maxThreads 64 mosquito.txt MosquitoPCwork MosquitoPCwork/mosquito.hal
hal2assemblyHub.py MosquitoPCwork/mosquito.hal MosquitoHub --maxThreads 64 --lod
