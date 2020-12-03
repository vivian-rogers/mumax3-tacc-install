#bash clean.sh
printf "======================================================================\n"
printf "                       MUMAX3 TACC INSTALLER                          \n"
printf "======================================================================\n"
printf "                                                                      \n"


printf "\nDownloading mumax3.10 with cuda 9.0 ... (this might take a second) \n"
wget https://mumax.ugent.be/mumax3-binaries/mumax3.10_linux_cuda9.0.tar.gz

printf "Extracting downloaded files... (this might take a second)\n"
tar -xvzf mumax3.10_linux_cuda9.0.tar.gz


cd mumax3.10_linux_cuda9.0
pre="export PATH="
execpath=$(pwd)
post=":\$PATH"
pathexport="$pre$execpath$post"
echo "####  MUMAX ALIASES BELOW  ####" >> ~/.bashrc 
echo $pathexport >> ~/.bashrc 
source ~/.bashrc
printf "Added mumax3 executables to path in your .bashrc\n"
cd ../

printf "Creating systems, outputs, and scripts folders...\n"
mkdir ../systems/
mkdir $SCRATCH/mumax3
mkdir ../systems/test/
mkdir ../outputs/
cp -r ./scripts ../
cp ./test.mx3 ../systems/test/


cd ../scripts/
pre="export PATH="
execpath=$(pwd)
post=":\$PATH"
pathexport="$pre$execpath$post"
echo $pathexport >> ~/.bashrc
printf "Added mumax3 scripts to path in your .bashrc\n"


cd ../outputs/
pre="export mumaxOutputPath="
execpath=$(pwd)
pwd
pathexport2="$pre'$execpath'"
echo $pathexport2 >> ~/.bashrc
printf "Added mumax3 output path as mumaxOutputPath in your .bashrc\n"
source ~/.bashrc
printf "Applied source to your .bashrc\n"
printf "Install complete!\n"

printf "\nWould you like to queue a test simulation? ( 1 for yes, 0 for no): "
read booltest

if (($booltest == 1 )); then
	printf "\n=========== RUNNING TEST CODE ===========\n"
        printf "    cd-ing into /systems/test... \n\n"
	cd ../systems/test/
        printf "    list files in directory with 'ls -lt': "
        ls -lt
	printf "\n    typing 'bash mumax3.sh general-mumax3.sl test.mx3'\n"
	printf "    (this runs the wrapper script 'mumax3.sl' to call the slurm script 'general-mumax3.sl' with test.mx3)\n"
	printf "    (after which the results will be copied back into /outputs/ )\n"
        bash mumax3.sh general-mumax3.sl test.mx3
	printf "\n\nCongrats! if all of that worked, then you can go make your own systems now and run them :^)\n"
	printf "Have fun with your magnets\n"
fi

