accessing
genotype
	" Answer a <BioGenotype> representing the receiver's genotype "

	^ genotype
		ifNil: [ genotype := BioGenotype new ]