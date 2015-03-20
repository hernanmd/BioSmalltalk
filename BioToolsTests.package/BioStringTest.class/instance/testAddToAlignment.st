testing
testAddToAlignment

	| align1 seq1 |
	
	align1 := BioAlignment new.
	seq1 :=  'ACGT' addToAlignment: align1.
	
	self assert: ( align1 isKindOf: BioAlignment ).
	self deny: align1 isEmpty.
	self assert: ( align1 sequenceStrings includes: 'ACGT' )
