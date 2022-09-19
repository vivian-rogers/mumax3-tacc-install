#bash clean.sh
printf "======================================================================\n"
printf "                       MUMAX3 TACC INSTALLER                          \n"
printf "======================================================================\n"
printf "                                                                      \n"


printf "\nDownloading mumax3.10 with cuda 11.0 ... (this might take a second) \n"
printf "(removing it if it already exists...)\n"
rm -r mumax3.10_linux_cuda11.0*
wget https://mumax.ugent.be/mumax3-binaries/mumax3.10_linux_cuda11.0.tar.gz

printf "Extracting downloaded files... (this might take a second)\n"
tar -xvzf mumax3.10_linux_cuda11.0.tar.gz

mm3path=$(pwd)

cd mumax3.10_linux_cuda11.0
pre="export PATH="
execpath=$(pwd)
post=":\$PATH"
pathexport="$pre$execpath$post"
echo "####  MUMAX ALIASES BELOW  ####" >> ~/.bashrc 
echo $pathexport >> ~/.bashrc 
source ~/.bashrc
printf "Added mumax3 executables to path in your .bashrc\n"

printf "Creating systems, outputs, and scripts folders...\n"
mkdir $mm3path/systems/
mkdir $SCRATCH/mumax3
mkdir $mm3path/systems/test/
mkdir $mm3path/outputs/
#cp -r ./scripts ../
cp $mm3path/test.mx3 $mm3path/systems/test/





cd $mm3path
pre="alias cdm='cd "
execpath=$(pwd)
post="'"
pathexport="$pre$mm3path$post"
echo $pathexport >> ~/.bashrc
printf "Added 'cdm' as alias to cd into mumax dir in .bashrc\n"


cd $mm3path/scripts/
pre="export PATH="
execpath=$(pwd)
post=":\$PATH"
pathexport="$pre$execpath$post"
echo $pathexport >> ~/.bashrc
printf "Added mumax3 scripts to path in your .bashrc\n"
cd ../

cd $mm3path/outputs/
pre="export mumaxOutputPath="
execpath=$(pwd)
pwd
pathexport2="$pre'$execpath'"
echo $pathexport2 >> ~/.bashrc
printf "Added mumax3 output path as mumaxOutputPath in your .bashrc\n"
source ~/.bashrc
printf "Applied source to your .bashrc\n"

printf "\n\n=============== Automated install over =================\n\n"


printf "one final thing... you should edit the general-mumax3.sl SLURM file.\n"
printf "Edit to include your email and TACC allocation!\n"
printf "(i.e., change the --user.email and -A flags so you can get notifs and run simulations.)\n"
printf "Enter your favorite snack to confirm: "
read snack
nano $mm3path/scripts/general-mumax3.sl
printf "Install complete!\n"

printf "\nWould you like to queue a test simulation? ( 1 for yes, 0 for no): "
read booltest

if (($booltest == 1 )); then
	printf "\n=========== RUNNING TEST CODE ===========\n"
        printf "    cd-ing into /systems/test... \n\n"
	cd $mm3path/systems/test/
        printf "    list files in directory with 'ls -lt': \n\n"
        ls -lt
	printf "\n    typing 'bash mumax3.sh general-mumax3.sl test.mx3'\n"
	printf "    (this runs the wrapper script 'mumax3.sl' to call the slurm script 'general-mumax3.sl' with test.mx3)\n"
	printf "    (after which the results will be copied back into /outputs/ )\n"
        bash mumax3.sh general-mumax3.sl test.mx3
	printf "\n\nCongrats! if all of that worked, then you can go make your own systems now and run them :)\n"
	printf "You can access the mumax3 folder by going to \"cdm\" and cd'ing into /systems/, where you might store your .mx3 files\n"
	printf "Go grab some $snack and simulate your micromagnetics.\n"
fi

cd ../

