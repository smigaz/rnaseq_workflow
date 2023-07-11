#!/bin/bash

echo "Input sample list file:"
read samples_list
echo "Imput tools dir:"
read tools_dir

mkdir -p ../trimmed
while IFS=" ", read -r id ; 
do 
	echo "START SAMPLE ID: "$id | grep --color -e ".*START.*" -e "^"

	sample=$(echo $id |  cut -f 1 -d '.')

        java -jar "$tools_dir"/Trimmomatic-0.39/trimmomatic-0.39.jar PE "$id"_1.fastq.gz "$id"_2.fastq.gz "$id"_1_trimmed.fq.gz "$id"_1_un_trimmed.fq.gz "$id"_2_trimmed.fq.gz "$id"_2_un_trimmed.fq.gz ILLUMINACLIP:"$tools_dir"/Trimmomatic-0.39/adapters/TruSeq3-SE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
        
        mv *_trimed* ../trimmed
        
done < $samples_list
