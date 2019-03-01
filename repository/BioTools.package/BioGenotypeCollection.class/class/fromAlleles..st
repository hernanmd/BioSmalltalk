instance creation
fromAlleles: aCollection
	" Answer a new instance of the receiver without tokens between each allele, aCollection contains each genotype as a two-sized String : #('CC' 'CC' 'TC' 'TT') "
	
	^ self new
		initializeFromAlleles: aCollection;
		yourself
