#!/bin/bash
#SBATCH -A ACCOUNT
#SBATCH --output=watershed_%j.log
#SBATCH --qos=test
#SBATCH --mail-type=END
#SBATCH --mail-user=EMAIL
#SBATCH --job-name=watersh
#SBATCH -n 8
#SBATCH --time=00:03:50
/opt/nce/bin/numainfo
echo $PATH
echo $LD_LIBRARY_PATH
pwd
export PATH=$PATH:$HOME/local/bin
export LD_LIBRARY_PATH=$HOME/local/lib:$LD_LIBRARY_PATH
export LD_RUN_PATH=$HOME/local/lib:$LD_RUN_PATH
export GDAL_DATA=$HOME/local/share/gdal
# GRASS script settings
export GISBASE=$HOME/local/grass81
export PATH=$PATH:$GISBASE/bin:$GISBASE/scripts
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$GISBASE/lib
# set PYTHONPATH to include the GRASS Python lib
if [ ! "$PYTHONPATH" ] ; then
   PYTHONPATH="$GISBASE/etc/python"
else
   PYTHONPATH="$GISBASE/etc/python:$PYTHONPATH"
fi
export PYTHONPATH

# use process ID (PID) as lock file number:
export GIS_LOCK=$$
# path to GRASS settings file
export GISRC=$HOME/.grass8/rc
module load gcc/9.2.0 python/3.8.2 libpng/1.6.13 fftw/3.3.3-gnu freetype mpfr/3.1.1 mpc/1.0.1
date
echo "GRASS fullscript starts."
OMP_NUM_THREADS=$SLURM_NTASKS
# this should print the GRASS version used:
g.version
# check GISDBASE, LOCATION_NAME, and MAPSET
g.gisenv
# Watershed delineation
r.watershed -s elevation=Kozep_Digitalis_Domborzatmodell_1m_EOV threshold=1000000 accumulation=accum_1M drainage=draindir_1M basin=basin_1M memory=6400

# GRASS cleanup routine
$GISBASE/etc/clean_temp

# remove session tmp directory:
rm -rf /tmp/grass8-${USER}-$GIS_LOCK

unset GIS_LOCK

date
