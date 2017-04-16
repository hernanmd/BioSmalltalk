accessing
end: anObject
	" Set anObject as the receiver's genotype end position "
	
	^ self genotype end:  (self validatePosition: anObject)