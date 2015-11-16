comparing
= aNucleotide

	self == aNucleotide ifTrue: [ ^ true ].
	^ self alleleA = aNucleotide and: [ self alleleB = aNucleotide ]