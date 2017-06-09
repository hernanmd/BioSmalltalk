examples
example02
	
	^ BioVCFRecordSample new
		name: 'NA00002';
		genotype: #(1 0);
		genotypeQuality: 48;
		readDepth: 8;
		haplotypeQuality: #(51 51);
		yourself