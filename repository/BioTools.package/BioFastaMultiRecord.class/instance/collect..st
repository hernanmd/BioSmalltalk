accessing
collect: aBlock
	" Evaluate aBlock with each of the receiver's fasta record as the argument. "
	
	^ self sequences collect: aBlock