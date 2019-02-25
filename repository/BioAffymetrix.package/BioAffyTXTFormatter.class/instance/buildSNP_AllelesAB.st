accessing-columns
buildSNP_AllelesAB
	" Answer a String with each row a SNP with Allele_A and Allele_B field values "

	^ self buildColumns: { 
		self indexOfProbesetId . 
		self indexOfAlleleA .
		self indexOfAlleleB }