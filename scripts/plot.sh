

module load python2


fermi=0
#fermi=$(grep Fermi qe-scf.*.out | awk 'BEGIN{temp=$5}{temp=$5}END{print temp}')
#printf "The detected fermi energy is $fermi eV\n"

#file="bands_gamma_up.co_im"


### give it the filename you're plotting as the first arg
file=$1

#for file in *_e1; do

printf "plotting $file\n"
python << END
import matplotlib.pyplot as plt
import numpy as np
import matplotlib as mpl
import csv
import pandas as pd
fig = mpl.pyplot.figure(figsize=(7,5))

#fig = mpl.pyplot.figure(figsize=(12,9.5))
ax1 = fig.add_subplot(111)


ymax = 4
ymin = 0

#xmin = 0
#xmax = 4.3479
x = []
y1 = []
y2 = []
y3 = []
y4 = []
y5 = []
with open('$file') as fp:
	line = fp.readline()
	line = fp.readline()
        while line:
		line = fp.readline()
		columns = line.split()
		if(len(columns)>1):
		 x.append(float(columns[0]))
               	 y1.append(float(columns[1]))
		else:
		 surface = plt.plot(x,y1,c='#111FFA')
                 x = []
		 y1 = []	
		# y2.append(float(columns[2]))
               	# y3.append(float(columns[3]))
               	# y4.append(float(columns[4]))
               	# y5.append(float(columns[5]))
               	 #y.append(float(columns[1]) - $fermi)


surface = plt.plot(x,y1,c='#111FFA')
#surface = plt.plot(x,y2,c='#FEB621')
#surface = plt.plot(x,y3,c='#777777')
#surface = plt.plot(x,y4,c='#111FFA')
#surface = plt.plot(x,y5,c='#FEB621')
#kpts = [xmin,0.7071,1.5731,2.5731,3.0731,xmax]
#kpts = np.array([0,0.7071,1.5731,2.5731,3.0731,3.5731])
#kptnames = ['W','L','G','X','W','K']
#i = 0
#for kpt in kpts:
#	x.append(float(kpts[i]))
#	x.append(float(kpts[i]))
#	y.append(ymin)
#	y.append(ymax)
#	surface = plt.plot(x,y,c='#111111')
#	x = []
#	y = []
#	i += 1

#plt.xticks(kpts,kptnames)
	

#ax1.set_xlim(-6,6)
#ax1.set_ylim(ymin,ymax)
#ax1.set_title("Transmission ", fontname="Arial", fontsize=15)
#ax1.set_ylabel("E - Ef (eV)", fontname="Arial", fontsize=15)
#ax1.set_xlabel("k", fontname="Arial", fontsize=15)

#fig.colorbar(surface, shrink=0.5, aspect=5, ticks = tickLt)
#plt.savefig("$file.png")
mpl.pyplot.show()
#plt.clf()
END

