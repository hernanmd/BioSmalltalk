examples
example02
	
	^ BioVCFRecordSample
		name: 'NA00002';
		genotype: #(1 0);
		genotypeQuality: 48;
		readDepth: 8;
		haplotypeQuality: #(51 51);
		yourself;
		inspect.