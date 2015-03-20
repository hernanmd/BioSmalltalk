instance creation - rna
newRNANamed: aString
	" Answer a new instance of the receiver with aString as its name "
	
	^ self new
		name: aString;
		alphabet: BioIUPACAmbiguousRNA new;
		yourself