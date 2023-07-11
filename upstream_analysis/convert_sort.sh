#!/bin/bash

echo "Input sample list file:"
read samples_list

while IFS=" ", read -r id ; 
do 
	echo "START SAMPLE ID: "$id | grep --color -e ".*START.*" -e "^"

	sample=$(echo $id |  cut -f 1 -d '.')

        samtools view -S -b /pool/smigas/data/aligment/"$id"_Aligned.out.sam > /pool/smigas/data/bams/"$id".bam
        samtools sort /pool/smigas/data/bams/"$id".bam -o /pool/smigas/data/bams/"$id"_sorted.bam
        rm /pool/smigas/data/bams/"$id".bam
        
        
done < $samples_list
