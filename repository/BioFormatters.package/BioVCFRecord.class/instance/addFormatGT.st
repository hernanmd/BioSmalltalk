accessing - format
addFormatGT
	" Set genotype, encoded as allele values separated by either of = or j. The allele values are 0 for the reference allele (what is in the REF eld), 1 for the first allele listed in ALT, 2 for the second allele list in ALT and so on. For diploid calls examples could be 0=1, 1 j 0, or 1=2, etc. For haploid calls, e.g. on Y, male nonpseudoautosomal X, or mitochondrion, only one allele value should be given; a triploid call might look like 0=0=1. If a call cannot be made for a sample at a given locus, `.' should be specified for each missing allele in the GT field (for example `:=:' for a diploid genotype and `.' for haploid genotype). The meanings of the separators are as follows (see the PS eld below for more details on incorporating phasing information into the genotypes):
	/ : genotype unphased 
	| : genotype phased "

	self formats add: 'GT'
