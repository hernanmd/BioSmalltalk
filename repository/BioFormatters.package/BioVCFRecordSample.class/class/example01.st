examples
example01

	^ BioVCFRecordSample new
		name: 'NA00001';
		genotype: #(0 0);
		genotypeQuality: 48;
		readDepth: 1;
		haplotypeQuality: #(51 51);
		yourself
