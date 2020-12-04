#!/bin/bash


if [ -z "$2" ]
then
printf "Incorrect usage! Call using 'bash mumax3.sh [SLURM script to run] [mumax3 input filename]\n"
printf "maybe consider using general-mumax3.sh as the slurm script?\n"
##### THIS IS WHERE YOU CAN ADD MORE DOCUMENTATION
##### use more printfs to list the options


else


DATE=$(date "+%H-%M_%A_%B_%d_%Y")
FOLDERNAME="$2-$1-$DATE"
printf "\n================ mumax3 script wrapper ==================\n"
printf "Queueing $1 with $2 into scratch directory\n"
printf "it will be copied back into /outputs/ when finished\n"
sbatch --export=ALL,FOLDERNAME=$FOLDERNAME,FILENAME=$2,mumaxOutputPath=$mumaxOutputPath $1

fi
