Extension { #name : #BioDNANucleotide }

{ #category : #'*BioLAMPLD' }
BioDNANucleotide >> asLAMPLDGenotypeCode: aBioGenotype [
	" Answer 0, 1 or 2 according to genotype interpretation in LAMP-LD software: 0/1/2 denotes number of reference alleles "

	^ aBioGenotype = self letter
		ifTrue: [ 2 ]
		ifFalse: [ aBioGenotype ~= self letter
			ifTrue: [ 0 ]
			ifFalse: [ 1 ] ]
]
