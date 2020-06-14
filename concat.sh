# Concatenation.
#ce script permet la concaténation des différents fichiers .fastq.gz
#commande : ./concat.sh


	# 1. S1


cat *_S1_*_R1_*.fastq.gz >K9me3_KO_S1_R1.fastq.gz &
cat *_S1_*_R2_*.fastq.gz >K9me3_KO_S1_R2.fastq.gz

	# 2. S2

cat *_S2_*_R1_*.fastq.gz > K9me3_KO_control_S2_R1.fastq.gz &
cat *_S2_*_R2_*.fastq.gz > K9me3_KO_control_S2_R2.fastq.gz


	# 3. S3


cat *_S3_*_R1_*.fastq.gz > K9me3_NT_S3_R1.fastq.gz &
cat *_S3_*_R2_*.fastq.gz > K9me3_NT_S3_R2.fastq.gz

	# 4. S4


cat *_S4_*_R1_*.fastq.gz >Input_KO_S4_R1.fastq.gz &
cat *_S4_*_R2_*.fastq.gz >Input_KO_S4_R2.fastq.gz

	# 5. S5

cat *_S5_*_R1_*.fastq.gz > Input_KO_control_S5_R1.fastq.gz &
cat *_S5_*_R2_*.fastq.gz > Input_KO_control_S5_R2.fastq.gz


	# 6. S6
cat *_S6_*_R1_*.fastq.gz >Input_NT_S6_R1.fastq.gz &
cat *_S6_*_R2_*.fastq.gz >Input_NT_S6_R2.fastq.gz

	# 7. S7  
cat *_S7_*_R1_*.fastq.gz >K4me3_KO_S7_R1.fastq.gz &
cat *_S7_*_R2_*.fastq.gz >K4me3_KO_S7_R2.fastq.gz

	# 8. S8 
cat *_S8_*_R1_*.fastq.gz >K4me3_KO_control_S8_R1.fastq.gz &
cat *_S8_*_R2_*.fastq.gz >K4me3_KO_control_S8_R2.fastq.gz

	# 9. S9 
cat *_S9_*_R1_*.fastq.gz >K4me3_NT_S9_R1.fastq.gz &
cat *_S9_*_R2_*.fastq.gz >K4me3_NT_S9_R2.fastq.gz

