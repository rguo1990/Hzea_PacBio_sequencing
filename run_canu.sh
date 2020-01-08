## PacBio long reads correction

## create specific folders for Canu results
## GA#: different GA_samples
mkdir canu_corrected
cd canu_corrected
mkdir GA#

## run canu to correct reads errors 
~/Documents/Programs/canu/Linux-amd64/bin/canu -p GA# -d ./canu_corrected/GA# genomeSize=5500 -pacbio-raw GA#.fa 



