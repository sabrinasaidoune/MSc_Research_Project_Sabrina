#!/bin/bash
#SBATCH --job-name=fastqc_follicles
#SBATCH --output=fastqc_follicles_%j.out
#SBATCH --error=fastqc_follicles_%j.err
#SBATCH --time=04:00:00
#SBATCH --cpus-per-task=8
#SBATCH --mem=16G

module load fastqc 

#------------------------
# Paths on HPC
#------------------------
FASTQ_DIR=/scratch/prj/wch_ovarian_ageing/research_project/transcriptomics_ovary/fastq_raw
FASTQC_OUT=/scratch/prj/wch_ovarian_ageing/research_project/transcriptomics_ovary/fastqc_results

# Create output directory if it doesn't exist
mkdir -p $FASTQC_OUT

#------------------------
# Run FastQC on all FASTQ files
#------------------------
for fq in $FASTQ_DIR/*.fq.gz; do
    echo "Running FastQC for $fq"
    fastqc -t 8 -o $FASTQC_OUT $fq
done

echo "FastQC analysis completed. Results in $FASTQC_OUT"