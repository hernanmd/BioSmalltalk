comparing
like: aFastaMultiRecord
	" Two multi fasta are alike if
	 (a) they are equal
	 (b) for each fasta record, they have the same sequences in any order "
	
	self 			== aFastaMultiRecord 			ifTrue: [ ^ true ].
	self class 	= aFastaMultiRecord class 	ifFalse: [ ^ false ].
	self size 	= aFastaMultiRecord size 	ifFalse: [ ^ false ] .
	self sequences allSatisfy: [ : record | aFastaMultiRecord includes: record ].
	^ true