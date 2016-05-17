LAMP-LD : http://bogdan.bioinformatics.ucla.edu/software/lamp/

LAMP is a software package for the inference of locus-specific ancestry in recently admixed populations. It includes a few versions as described below.

LAMP-LD takes the genotypes of admixed individuals as well as reference haplotype panels approximating the mixing ancestral populations, and outputs the estimated number of alleles from each ancestry in each locus for each individual.

The LAMP-LD package also includes the program LAMP-HAP, which processes haplotype data when high-quality phasing is available, and utilizes trio nuclear family designs to improve estimation accuracy.

LAMP-LD is based on a window-based processing combined within a hierarchical Hidden Markov Model. It can process 2,3 or 5 mixing populations, and its short per-sample processing time makes it suitable for analyzing large datasets of dense SNP panels. 

This wrapper REPLACES the need to run the perl script run_LAMPLD.pl provided by the software.

