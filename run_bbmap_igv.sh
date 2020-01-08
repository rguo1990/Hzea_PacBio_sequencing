## uncompress the canu corrected reads and copy them to a new folder "canu_corrected_samples"
## GA#: different GA samples, such as GA1, GA2, GA3...
mkdir canu_corrected_samples
gunzip ./canu_corrected/GA#/GA#.correctedReads.fasta.gz
cp ./canu_corrected/GA#/GA#.correctedReads.fasta ./canu_corrected_samples

## use bbmap to align the corrected reads to the reference cDNA
cd ./canu_corrected_samples
for sample in *.fasta
do
	echo $sample
	describer=$(echo ${sample} | sed 's/.correctedReads.fasta//')
	echo $describer
	
	## run bbmap, using the script special for PacBio long reads
	~/Documents/Programs/bbmap/mapPacBio.sh ref=~/Rong/H_zea/cad86c.fasta in=$sample outm=${describer}.sam

done

## convert SAM files to BAM files, sort and index the BAM files
for sample in *.sam
do 
	echo $sample
	describer=$(echo ${sample} | sed 's/.sam//')
	echo $describer
	
	#convert file from SAM to BAM format
	samtools view -bS $sample -o ${describer}.uns.bam

	#Sort BAM file
	samtools sort ${describer}.uns.bam > ${describer}.sorted.bam

	#Index BAM file
	samtools index ${describer}.sorted.bam

done

