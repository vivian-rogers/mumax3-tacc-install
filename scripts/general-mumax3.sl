#!/bin/bash
#SBATCH -J mumax3-general        # Job Name
#SBATCH -o mumax.o%j  # output and error file name (%j expands to jobID) Name of the output file (eg. myMPI.oJobID)
#SBATCH -n 4         # number of tasks per node
#SBATCH -N 1         # total number of mpi tasks requested
#SBATCH -p gpu-a100              # Queue name
#SBATCH -t 24:00:00       # Run time (hh:mm:ss) - 0.25 hours (max is 48 hours)
#SBATCH --mail-user=your.email@utexas.edu    # Email notification address -- should set this!
#SBATCH --mail-type=ALL                  # Email at Begin/End of job  (UNCOMMENT)
#SBATCH -A OTH21017

module load gcc
module load cuda


### staging files for copy to scratch
FOLDERPATH=$SCRATCH/mumax3/$FOLDERNAME 
mkdir $FOLDERPATH
cp -r * $FOLDERPATH
cd $FOLDERPATH


### running desired calculations, postprocessing
ibrun mumax3 $FILENAME


### copy files back to output folder
cd ../
cp -r $FOLDERPATH $mumaxOutputPath
