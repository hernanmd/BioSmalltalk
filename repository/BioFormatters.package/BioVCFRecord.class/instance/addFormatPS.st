accessing - format
addFormatPS
	" Set the phase set. A phase set is dened as a set of phased genotypes to which this genotype belongs. Phased genotypes for an individual that are on the same chromosome and have the same PS value are in the same phased set. A phase set species multi-marker haplotypes for the phased genotypes in the set. All phased genotypes that do not contain a PS subeld are assumed to belong to the same phased set. If the genotype in the GT field is unphased, the corresponding PS field is ignored. The recommended convention is to use the position of the first variant in the set as the PS identier (although this is not required). (Non-negative 32-bit Integer) "

	self formats add: 'PS'
