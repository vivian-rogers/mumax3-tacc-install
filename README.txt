


=========================================================================
               mumax3 TACC autoinstaller + userguide
=========================================================================
                       developed for inclab 

DOWNLOAD
First, one should create a mumax folder somewhere on /work/. 
Get the zip archive direct link from the box or github or email, enter your mumax folder, and type "wget [direct link to file]"
Can also do "module load git" and "git clone [line to this git repo]" to get the files without having to extract
Maybe use git if you ever want to contribute back to this repository, and modify scripts and improve them for the group. 


INSTALLATION
 - If using zip file:
To extract, type "unzip [filename]". 
 - If using git: 
module load git -> git clone [etc etc.git]
perform "cd install-mumax3-tacc" ... or maybe it's just "cd install"
To install, one should type (exactly) ". ./install.sh"
there should be little else that needs to be done. This will download and extract a precompiled binary, and set up the environment to run the scripts
this will also add the necessary paths to your .bashrc file automatically. 


RUNNING SIMULATIONS
a wrapper script will handle the actual slurm "sbatch [slurm script]" calls, prepare to copy to /scratch/, can provide documentation, and will name/date your simulations. 
After running on /scratch/, your simulations will be copied back to /work/.../outputs/.  to use, type 
	
	"bash mumax3.sh [name of slurm script you want to call] [filename of mumax3 file]"

the slurm scripts end in a .sl suffix, and can be created with the particular parameters you need (compute time, nodes, tasks, etc). Please change the email. 
Please change the email. 
A general purpose "general-mumax3.sl" sbatch script is provided. 
the systems you want to simulate might be created in new folders in /systems/. A template system is provided. Might change it for your needs.  



SCRIPTS
for fun, I included one of my general-purpose plotting scripts. This will plot the first column of data against the second column of data, and can be modified. 
I am unsure if this helps, but I hope so. Call it with "bash plot.sh". May need to module load python or module load matplotlib, it is a very old and ugly script and may need tweaking to run here. 
Happy to help you get it working though, it is very very useful and imo matplotlib >>>>>> matlab for plotting :P


CONTACT
if you need any help with the install script, I can be reached at vivian.rogers@utexas.edu. Or ask Can or Sam, they could totally help. 
