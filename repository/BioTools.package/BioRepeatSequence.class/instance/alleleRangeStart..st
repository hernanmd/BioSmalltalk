accessing
alleleRangeStart: anObject
	" Set anObject as the receiver's genotype start position "
	
	^ self genotype alleleA: (self validatePosition: anObject)