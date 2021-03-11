
mumax3 TACC autoinstaller + userguide
=========================================================
developed for inclab

**DOWNLOAD**

First, one should create a mumax folder somewhere on /work/. (use cdw to move to /work/).
Perform `module load git` and `git clone [link to this git repo]` to pull these files into your directory. This link can be pulled from the green button at the top right of the git page. 


**INSTALLATION**
 - If using zip file:
To extract, type `unzip [filename]`.
 - If using git:
    1. module load git -> git clone [https://etc etc.git]
    2. perform `cd install-mumax3-tacc` 
    3. To install, one should type (exactly) `. ./install.sh`
    4. There should be little else that needs to be done. This will download and extract a precompiled binary, and set up the environment to run the scripts.
    5. This will also add the necessary paths to your .bashrc file automatically.
    6. EDIT THE EMAIL in the .sl script if you care to recieve notifications about your simulation. For example, I would set mine to =vivian.rogers@utexas.edu

**RUNNING SIMULATIONS**

A wrapper script will handle the actual slurm `sbatch [slurm script]` calls, prepare to copy to /scratch/, can provide documentation, and will name/date your simulations.
After running on /scratch/, your simulations will be copied back to /work/.../outputs/.  to use, type

    bash mumax3.sh [name of slurm script you want to call] [filename of mumax3 file]

The slurm scripts end in a .sl suffix, and can be created with the particular parameters you need (compute time, nodes, tasks, etc). Please change the email.
Please change the email.
A general purpose `general-mumax3.sl` sbatch script is provided.
The systems you want to simulate might be created in new folders in /systems/. A template system is provided. Might change it for your needs.



**SCRIPTS**

I have included one of my general-purpose plotting scripts. This will plot the first column of data against the second column of data, and can be modified.
Call it with `bash plot.sh`. This could be used for plotting B vs H hysteresis loops, though I am unfamiliar with the exact output format of mumax3 simulations. May need to module load python or module load matplotlib, also it is a very old and ugly script and may need tweaking to run here.


**CONTACT**

If you need any help with the install script, I can be reached at vivian.rogers@utexas.edu. 
