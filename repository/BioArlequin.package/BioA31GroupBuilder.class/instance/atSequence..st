accessing
atSequence: aString 
	" Answer a <String> "

	^ (self haplotypes 
		detect: [ : hap | hap sequence = aString ]
		ifNone: [ self error: 'Haplotype not found' ]) name.