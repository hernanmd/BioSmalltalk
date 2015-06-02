accessing
initializeHaplotypes

	| index |
	index := 0.
	^ self haplotypesBag  asSet collect: [ : sequence | 
		index := index + 1.
		BioHaplotype new 
			name: 'h' , index asString;
			sequence: sequence;
			popFreq: (self haplotypesBag occurrencesOf: sequence);
			yourself ].