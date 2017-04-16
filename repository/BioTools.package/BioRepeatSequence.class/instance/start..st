accessing
start: anObject
	" Set anObject as the receiver's genotype start position "
	
	^ self genotype start: (self validatePosition: anObject)