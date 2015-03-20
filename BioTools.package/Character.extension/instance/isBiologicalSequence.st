*BioTools
isBiologicalSequence
	" Answer <true> if the receiver represents an identifiable biological letter "
	
	^ self isDNASequence or: [ self isRNASequence or: [ self isProteinSequence ] ]