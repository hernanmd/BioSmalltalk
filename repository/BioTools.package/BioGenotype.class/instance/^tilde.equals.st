comparing
~= aNucleotide

	self == aNucleotide ifTrue: [ ^ false ].
	^ self alleleA ~=  aNucleotide and: [ self alleleB ~= aNucleotide ]