instance creation - rna
newRNA: aString
	" Answer a new instance of the receiver with aString as the sequence "
	
	^ self newUnambiguousRNA: aString