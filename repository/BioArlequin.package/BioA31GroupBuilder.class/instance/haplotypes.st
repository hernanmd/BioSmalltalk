accessing
haplotypes
	^ haplotypes
		ifNil: [ haplotypes := self initializeHaplotypes ]