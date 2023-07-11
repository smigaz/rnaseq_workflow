#!/bin/bash

echo "Input sample list file:"
read samples_list


while IFS=" ", read -r id ; 
do 
	echo "START SAMPLE ID: "$id | grep --color -e ".*START.*" -e "^"

	sample=$(echo $id |  cut -f 1 -d '.')
	
        cd ~/bams
        
        htseq-count -s no -r pos -t exon -i gene -f bam "$id"_sorted.bam ~/reference/GCF_000001635.27/ncbi_dataset/data/GCF_000001635.27/genomic.gff > ~/counts/"$id"-output_basename.count
        
        
done < $samples_list
