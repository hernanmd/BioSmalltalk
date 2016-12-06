accessing
alleleRangeEnd: anObject
	" Set anObject as the receiver's genotype end position "
	
	^ self genotype alleleB:  (self validatePosition: anObject)