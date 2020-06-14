

mkdir data/fastqc



# fastqc controle qualité
fastqc data/*.fastq.gz -o data/fastqc
# Multiqc
multiqc data/fastqc/ . -o data/fastqc/
"""
# Trim adaptaters 
# scythe -o output_file -a adapters.fasta input_file

scythe -o /rawdata/output_file.scythe.R1.fastq -a /rawdata/adapters.fasta /rawdata/input_R1.fastq.gz &
scythe -o /rawdata/output_file.scythe.R2.fastq -a /rawdata/adapters.fasta /rawdata/input_R2.fastq.gz 


# Trim low quality with sickle PE
sickle pe -f rawdata/output_file.scythe.R1.fastq -r rawdata/output_file.scythe.R2.fastq \
    -t sanger -o rawdata/output_file.sickle.R1.fastq \
    -p rawdata/output_file.sickle.R2.fastq \
    -s dev/null # option -q 30 seuil de qualité si besoin si non par défaut 20

# Quality control for trimmed files
fastqc rawdata/*.sickle.*.fastq -o rawdata/fastqc


#cette partie n'a pas été appliqué car nos données ne contiennent pas d'erreurs ou de contamination d'adaptateur

"""


