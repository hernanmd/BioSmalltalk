initialize-release
valueFor: rs
	" Private - Assign a valid null value for HaploView file format.
	Write two alleles for a column, answer this 'column' (String delimited by space)
	Unread/invalid values from input assumed to be $- "
	
	^ String streamContents: [: str | 
		| allele1 allele2 |
		allele1 := rs third = '-' ifTrue: [ '0' ] ifFalse: [ rs third ].
		allele2 := rs fourth = '-' ifTrue: [ '0' ] ifFalse: [ rs fourth ].				
		str 
			nextPutAll: allele1; 
			space; 
			nextPutAll: allele2 ]