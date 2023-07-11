#!/bin/bash
echo "Input sample list file:"
read samples_list

while IFS=" ", read -r id ; 
do 
	echo "START SAMPLE ID: "$id | grep --color -e ".*START.*" -e "^"

	sample=$(echo $id |  cut -f 1 -d '.')

        cd /pool/smigas/data/trimmed/
        STAR --runThreadN 5 --genomeDir /pool/smigas/reference/ --readFilesIn "$id"_1_trimmed.fq.gz,"$id"_2_trimmed.fq.gz --readFilesCommand gunzip -c --outFileNamePrefix /pool/smigas/data/aligment/"$id"_ --sjdbGTFfile /pool/smigas/reference/genomic.gff
        
done < $samples_list
