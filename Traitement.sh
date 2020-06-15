# Commande a exécuter pour une analyse de données Chip Seq avec données triées

mkdir results						 # Repertoir des résultats
mkdir results/sam
mkdir results/bam
mkdir results/sorted_bam 		    # fichiers bam trié
mkdir results/BigWig
mkdir result/braodpeak
mkdir results/narrowpeak 



#2.	Alignement du fichier de traite ment avec l'index   rawdata est le repertoir contennat les .fastq
bowtie2  --local -x GCA_000001405 -1 data/K9me3_KO_S1_R1.fastq.gz -2 data/K9me3_KO_S1_R2.fastq.gz -S results/sam/K9me3_KO_S1.sam -p 2 &&
bowtie2  --local -x GCA_000001405 -1 data/K9me3_KO_control_S2_R1.fastq.gz -2 data/K9me3_KO_control_S2_R2.fastq.gz-S results/sam/K9me3_KO_control_S2.sam -p 2 &&
bowtie2  --local -x GCA_000001405 -1 data/K9me3_NT_S3_R1.fastq.gz -2 data/K9me3_NT_S3_R2.fastq.gz -S results/sam/K9me3_NT_S3.sam -p 2 &&
bowtie2  --local -x GCA_000001405 -1 data/Input_KO_S4_R1.fastq.gz -2 data/Input_KO_S4_R2.fastq.gz  -S results/sam/Input_KO_S4.sam -p 2 &&
bowtie2  --local -x GCA_000001405 -1 data/Input_KO_control_S5_R1.fastq.gz -2 data/Input_KO_control_S5_R2.fastq.gz -S results/sam/Input_KO_control_S5.sam -p 2 &&
bowtie2  --local -x GCA_000001405 -1 data/Input_NT_S6_R1.fastq.gz -2 data/Input_NT_S6_R2.fastq.gz -S results/sam/Input_NT_S6.sam -p 2 &&
bowtie2  --local -x GCA_000001405 -1 data/K4me3_KO_S7_R1.fastq.gz -2 data/K4me3_KO_S7_R2.fastq.gz -S results/sam/K4me3_KO_S7.sam -p 2 &&
bowtie2  --local -x GCA_000001405 -1 data/K4me3_KO_control_S8_R1.fastq.gz -2 data/K4me3_KO_control_S8_R2.fastq.gz -S results/sam/K4me3_KO_control_S8.sam -p 2 &&
bowtie2  --local -x GCA_000001405 -1 data/K4me3_NT_S9_R1.fastq.gz -2 data/K4me3_NT_S9_R2.fastq.gz -S results/sam/K4me3_NT_S9.sam -p 2 

# Conversion sam to bam du fichier de traitement
samtools view -bSo results/bam/K9me3_KO_S1.bam results/sam/K9me3_KO_S1.sam &&
samtools view -bSo results/bam/K9me3_KO_control_S2.bam results/sam/K9me3_KO_control_S2.sam &&
samtools view -bSo results/bam/K9me3_NT_S3.bam results/sam/K9me3_NT_S3.sam &&
samtools view -bSo results/bam/Input_KO_S4.bam results/sam/Input_KO_S4.sam &&
samtools view -bSo results/bam/Input_KO_control_S5.bam results/sam/Input_KO_control_S5.sam &&
samtools view -bSo results/bam/Input_NT_S6.bam results/sam/Input_NT_S6.sam &&
samtools view -bSo results/bam/K4me3_KO_S7.bam results/sam/K4me3_KO_S7.sam &&
samtools view -bSo results/bam/K4me3_KO_control_S8.bam results/sam/K4me3_KO_control_S8.sam &&
samtools view -bSo results/bam/K4me3_NT_S9.bam results/sam/K4me3_NT_S9.sam 


# Tri du fichier traitement
samtools sort results/bam/K9me3_KO_S1.bam -o results/sorted_bam/K9me3_KO_S1.sorted.bam &&
samtools sort results/bam/K9me3_KO_control_S2.bam -o results/sorted_bam/K9me3_KO_control_S2.sorted.bam &&
samtools sort results/bam/K9me3_NT_S3.bam -o results/sorted_bam/K9me3_NT_S3.sorted.bam &&
samtools sort results/bam/Input_KO_S4.bam -o results/sorted_bam/Input_KO_S4.sorted.bam &&
samtools sort results/bam/Input_KO_control_S5.bam -o results/sorted_bam/Input_KO_control_S5.sorted.bam &&
samtools sort results/bam/Input_NT_S6.bam -o results/sorted_bam/Input_NT_S6.sorted.bam &&
samtools sort results/bam/K4me3_KO_S7.bam -o results/sorted_bam/K4me3_KO_S7.sorted.bam &&
samtools sort results/bam/K4me3_KO_control_S8.bam -o results/sorted_bam/K4me3_KO_control_S8.sorted.bam &&
samtools sort results/bam/K4me3_NT_S9.bam -o results/sorted_bam/K4me3_NT_S9.sorted.bam 

# indexer les fichiers bam pour un acces aléatoire par la suite 
samtools index results/sorted_bam/K9me3_KO_S1.sorted.bam &&
samtools index results/sorted_bam/K9me3_KO_control_S2.sorted.bam &&
samtools index results/sorted_bam/K9me3_NT_S3.sorted.bam &&
samtools index results/sorted_bam/Input_KO_S4.sorted.bam &&
samtools index results/sorted_bam/Input_KO_control_S5.sorted.bam &&
samtools index results/sorted_bam/Input_NT_S6.sorted.bam &&
samtools index results/sorted_bam/K4me3_KO_S7.sorted.bam &&
samtools index results/sorted_bam/K4me3_KO_control_S8.sorted.bam &&
samtools index results/sorted_bam/K4me3_NT_S9.sorted.bam 

# BedGraph a visualiser s
bamCoverage -b results/sorted_bam/K9me3_KO_S1.sorted.bam -o results/bedgraph/K9me3_KO_S1.bdg -of bedgraph -p 4 -bs 1000 --minMappingQuality 20  &&
bamCoverage -b results/sorted_bam/K9me3_KO_control_S2.sorted.bam -o results/bedgraph/K9me3_KO_control_S2.bdg  -of bedgraph -p 4 -bs 1000 --minMappingQuality 20 &&
bamCoverage -b results/sorted_bam/K9me3_NT_S3.sorted.bam -o results/bedgraph/K9me3_NT_S3.bdg  -of bedgraph -p 4 -bs 1000 --minMappingQuality 20 &&
bamCoverage -b results/sorted_bam/Input_KO_S4.sorted.bam -o results/bedgraph/Input_KO_S4.bdg  -of bedgraph -p 4 -bs 1000 --minMappingQuality 20 &&
bamCoverage -b results/sorted_bam/Input_KO_control_S5.sorted.bam -o results/bedgraph/Input_KO_control_S5.bdg  -of bedgraph -p 4 -bs 1000 --minMappingQuality 20 &&
bamCoverage -b results/sorted_bam/Input_NT_S6.sorted.bam -o results/bedgraph/Input_NT_S6.bdg  -of bedgraph -p 4 -bs 1000 --minMappingQuality 20 &&
bamCoverage -b results/sorted_bam/K4me3_KO_S7.sorted.bam -o results/bedgraph/K4me3_KO_S7.bdg  -of bedgraph -p 4 -bs 1000 --minMappingQuality 20 &&
bamCoverage -b results/sorted_bam/K4me3_KO_control_S8.sorted.bam -o results/bedgraph/K4me3_KO_control_S8.bdg  -of bedgraph -p 4 -bs 1000 --minMappingQuality 20 &&
bamCoverage -b results/sorted_bam/K4me3_NT_S9.sorted.bam  -o results/bedgraph/K4me3_NT_S9.bdg   -of bedgraph -p 4 -bs 1000 --minMappingQuality 20

# Fichier BigWig  bamCoverage -b results/sorted_bam/K4me3_KO_S7.sorted.bam -o results/BigWig/K4me3_KO_S7.bw -of bigwig  -p 4 -bs 1000 --minMappingQuality 20 &&
bamCoverage -b results/sorted_bam/K9me3_KO_control_S2.sorted.bam -o results/BigWig/K9me3_KO_control_S2.bw  -of bigwig -p 4 -bs 1000 --minMappingQuality 20 &&
bamCoverage -b results/sorted_bam/K9me3_NT_S3.sorted.bam -o results/BigWig/K9me3_NT_S3.bw -of bigwig  -p 4 -bs 1000 --minMappingQuality 20 &&
bamCoverage -b results/sorted_bam/Input_KO_S4.sorted.bam -o results/BigWig/Input_KO_S4.bw  -of bigwig  -p 4 -bs 1000 --minMappingQuality 20 &&
bamCoverage -b results/sorted_bam/Input_KO_control_S5.sorted.bam -o results/BigWig/Input_KO_control_S5.bw -of bigwig  -p 4 -bs 1000 --minMappingQuality 20 &&
bamCoverage -b results/sorted_bam/Input_NT_S6.sorted.bam -o results/BigWig/Input_NT_S6.bw  -of bigwig  -p 4 -bs 1000 --minMappingQuality 20 &&
bamCoverage -b results/sorted_bam/K4me3_KO_control_S8.sorted.bam -o results/BigWig/K4me3_KO_control_S8.bw  -of bigwig -p 4 -bs 1000 --minMappingQuality 20 &&
bamCoverage -b results/sorted_bam/K4me3_NT_S9.sorted.bam  -o results/BigWig/K4me3_NT_S9.bw   -of bigwig  -p 4 -bs 1000 --minMappingQuality 20


# Peakcalling with control on Macs2, for narrowpeaks: H3K4me3
macs2 callpeak -t results/bam/K4me3_KO_S7.bam -c results/bam/Input_KO_S4.bam --format=BAMPE --name=K4me3_KO_S7_control --gsize=hs --outdir results/narrowpeak &&
macs2 callpeak -t results/bam/K4me3_KO_control_S8.bam -c results/bam/Input_KO_control_S5.bam --format=BAMPE --name=K4me3_KO_control_S8_control --gsize=hs --outdir results/narrowpeak &&
macs2 callpeak -t results/bam/K4me3_NT_S9.bam -c results/bam/Input_NT_S6.bam --format=BAMPE --name=K4me3_NT_S9_control --gsize=hs --outdir results/narrowpeak &&

# Peakcalling with control on Macs2, for broadpeaks : H3K9me3

macs2 callpeak --broad -t results/bam/K9me3_KO_S1.bam -c results/bam/Input_KO_S4.bam --format=BAMPE --name=K9me3_KO_S1_control --gsize=hs --outdir results/broadpeak  &&
macs2 callpeak --broad -t results/bam/K9me3_KO_control_S2.bam -c results/bam/Input_KO_control_S5.bam --format=BAMPE --name=K9me3_KO_control_S2_control --gsize=hs --outdir results/broadpeak &&
macs2 callpeak --broad -t results/bam/K9me3_NT_S3.bam -c results/bam/Input_NT_S6.bam --format=BAMPE --name=K9me3_NT_S3_control --gsize=hs --outdir results/broadpeak 

