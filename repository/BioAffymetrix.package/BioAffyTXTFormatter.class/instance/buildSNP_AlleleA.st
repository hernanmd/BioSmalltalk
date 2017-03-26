as yet unclassified
buildSNP_AlleleA
	" Answer a String with each row a SNP with Allele_A and Allele_B field values. The Allele_A is the allele of the SNP that is in lower alphabetical order "

	^ self buildColumns: { 
		self indexOfProbesetId . 
		self indexOfAlleleA }