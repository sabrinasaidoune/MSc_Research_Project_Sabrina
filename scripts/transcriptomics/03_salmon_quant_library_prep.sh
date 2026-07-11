#!/bin/bash
#SBATCH --job-name=salmon_index
#SBATCH --output=salmon_index_%j.out
#SBATCH --error=salmon_index_%j.err
#SBATCH --time=04:00:00
#SBATCH --cpus-per-task=8
#SBATCH --mem=16G

module load salmon

#------------------------
# Paths
#------------------------
TRANSCRIPTOME_FA=/scratch/prj/wch_ovarian_ageing/research_project/transcriptomics_ovary/genome_mm10/Mus_musculus.GRCm39.cdna.all.fa.gz
INDEX_OUT=/scratch/prj/wch_ovarian_ageing/research_project/transcriptomics_ovary/genome_mm10/Salmon_transcripts_index_v2

#------------------------
# Build index (no decoys)
#------------------------
salmon index \
    -t $TRANSCRIPTOME_FA \
    -i $INDEX_OUT \
    -k 31 \
    -p 8

echo "Salmon index built at $INDEX_OUT"