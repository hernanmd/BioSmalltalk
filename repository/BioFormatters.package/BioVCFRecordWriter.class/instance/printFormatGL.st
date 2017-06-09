accessing - format
printFormatGL
	" Set genotype likelihoods comprised of comma separated foating point log10-scaled likelihoods for all possible genotypes given the set of alleles dened in the REF and ALT fields. In presence of the GT field the same ploidy is expected and the canonical order is used; without GT eld, diploidy is assumed. If A is the allele in REF and B,C,... are the alleles as ordered in ALT, the ordering of genotypes for the likelihoods is given by: F(j/k) = (k*(k+1)/2)+j. In other words, for biallelic sites the ordering is: AA,AB,BB; for triallelic sites the ordering is: AA,AB,BB,AC,BC,CC, etc. For example: GT:GL 0/1:-323.03,-99.29,-802.53 (Floats) "

	self appendFormatDelimiter.
	self formatStream nextPutAll: 'GL'
