accessing
asLAMPLDGenotypeCode: aBioGenotype
	" Answer 0, 1 or 2 according to genotype interpretation in LAMP-LD software"

	^ aBioGenotype = self letter
		ifTrue: [ 2 ]
		ifFalse: [ aBioGenotype ~= self letter
			ifTrue: [ 0 ]
			ifFalse: [ 1 ] ]