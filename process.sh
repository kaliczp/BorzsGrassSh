#!/bin/bash
#SBATCH -A ACCOUNT
#SBATCH --qos=test
#SBATCH --mail-type=ALL
#SBATCH --mail-user=EMAIL
#SBATCH --job-name=watershed
#SBATCH -n 8
#SBATCH --time=00:30
#SBATCH -o slurm.out
/opt/nce/bin/numainfo
export PATH=$PATH:~/local/bin
export LD_LIBRARY_PATH=~/local/lib:$LD_LIBRARY_PATH
export LD_RUN_PATH=~/local/lib:$LD_RUN_PATH
export GDAL_DATA=~/local/share/gdal
export GRASS_BATCH_JOB=~/BorzsGrassSh/watershed.sh
pwd; hostname; date
OMP_NUM_THREADS=$SLURM_NTASKS
module load gcc/9.2.0 python/3.8.2 libpng/1.6.13 fftw/3.3.3-gnu freetype mpfr/3.1.1 mpc/1.0.1
srun grass --text ~/grassdata/DINPIkozepTeszt/PERMANENT
unset GRASS_BATCH_JOB
date
