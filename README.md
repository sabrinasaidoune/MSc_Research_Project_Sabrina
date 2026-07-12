# Temporal Multi-Omics Analysis of Ovarian Development

### Integrating Proteomics and Transcriptomics to Identify Regulatory Programmes Across the Mouse Reproductive Life Course

---

**MSc Applied Bioinformatics Dissertation**
King's College London — Faculty of Life Sciences & Medicine
July 2026

**Author:** Sabrina Souhaya Saidoune
**Supervisors:** Dr Michelle Simon & Dr Kim Jonas

---

## About This Project

Ovarian ageing is one of the most rapid ageing processes in the mammalian body, driving the progressive decline of reproductive capacity through follicle depletion, endocrine remodelling, and structural changes in ovarian tissue. Yet most existing studies examine molecular mechanisms in isolation, either at a single timepoint or through a single omics layer, leaving the temporal dynamics of ovarian ageing across the full reproductive life course poorly understood.

This project takes an integrative, temporally resolved multi-omics approach to characterise the molecular programmes governing ovarian development and ageing in a murine model. Bulk RNA-seq and temporal proteomics (across three subcellular fractions — cellular, soluble, and insoluble) were generated across six timepoints spanning the full reproductive life course:

| Timepoint | Stage | RNA-seq |
|---|---|---|
| D14 | Pre-pubertal | ✓ |
| D21 | Pre-pubertal | ✓ |
| M03 | Sexually mature, actively cycling | ✓ |
| M06 | Peak reproductive capacity | ✓ |
| M12 | Onset of reproductive decline | ✓ |
| M18 | Reproductively aged, largely anovulatory | ✓ |

RNA-seq and proteomic datasets were integrated using **MEFISTO/MOFA2**, a temporal multi-omics factor analysis framework, to distinguish transcriptionally driven regulatory programmes from post-transcriptionally regulated ones — building a molecular map of ovarian ageing across the reproductive lifespan.

### Key Analyses
- Differential gene expression (DESeq2) — young vs old, and across all six timepoints
- Temporal proteomic profiling across cellular, soluble, and insoluble fractions
- Pairwise and one-way ANOVA statistical testing of protein trajectories
- GO:BP and KEGG enrichment analysis, with rrvgo-based redundancy reduction
- Multi-omics factor integration (MEFISTO/MOFA2) across RNA-seq and proteomics
- Post-hoc RNA–protein concordance/discordance classification

---

## Repository Structure

```
├── data/
│   ├── transcriptomics/                  # RNA-seq counts matrices and processed outputs
│   ├── proteomics/
│   │   ├── raw_data/                     # Raw Spectronaut outputs (cellular + soluble fractions)
│   │   └── cleaned_data/                 # Cleaned/processed proteomics data
│   └── multi_omics_integrated/           # Combined RNA-protein integration inputs
│
├── scripts/
│   ├── transcriptomics/                  # FastQC → trimming → Salmon → tximport → DESeq2 → visualisation
│   ├── proteomics/                       # Cleaning, Welch t-tests, ANOVA, enrichment
│   └── integration/                      # MEFISTO/MOFA2 multi-omics integration
│
├── results/
│   ├── transcriptomics/
│   │   ├── tables/                       # DESeq2 results, DEG summaries
│   │   └── plots/                        # PCA, volcano plots, heatmaps
│   ├── proteomics/
│   │   ├── tables/                       # ANOVA, Welch t-test, enrichment results
│   │   └── plots/                        # Temporal trajectory plots, enrichment barplots
│   └── multi_omics_integrated/
│       ├── tables/                       # MEFISTO/MOFA2 factor outputs, RNA-protein concordance
│       └── plots/                        # Integrated factor plots, concordance scatterplots
│
├── environment/                            # Software versions and reproducibility information
│
└── README.md
```

### Where to find things

| Looking for... | Go to |
|---|---|
| RNA-seq counts data | `data/transcriptomics/` |
| Raw/cleaned proteomics data | `data/proteomics/` |
| Combined multi-omics input data | `data/multi_omics_integrated/` |
| The RNA-seq processing pipeline (FastQC → DESeq2) | `scripts/transcriptomics/` |
| Proteomics cleaning and statistical testing | `scripts/proteomics/` |
| Multi-omics integration (MEFISTO/MOFA2) | `scripts/integration/` |
| Transcriptomics results (DEGs, plots) | `results/transcriptomics/` |
| Proteomics results (ANOVA, enrichment) | `results/proteomics/` |
| Integrated multi-omics results | `results/multi_omics_integrated/` |
| Software versions and parameters used | `environment/` |

---

## Reproducibility

Exact software versions, HPC module versions, and key analysis parameters (e.g. Salmon indexing, cutadapt trimming settings) used in this project are documented in [`environment/`](./environment).

Analyses were run using a combination of King's College London's **CREATE HPC cluster** (transcriptomic pre-processing: FastQC, cutadapt, Salmon) and local R environments (DESeq2, proteomics statistics, MEFISTO/MOFA2 integration, visualisation).

---

## Declaration

This dissertation is submitted in partial fulfilment of the requirements for the degree of MSc Applied Bioinformatics at King's College London. This is the author's own work; sources have been properly acknowledged and referenced throughout.

---

## Acknowledgements

With thanks to my supervisors, Dr Michelle Simon and Dr Kim Jonas, for their guidance and support throughout this project, and to the Reproductive Physiology Laboratory at King's College London for generating the data used in this work.
