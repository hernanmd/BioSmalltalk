*BioTools
includesEndsWith: aString
	" Answer whether aString ends like one of the receiver's sub strings elements. "

	^ self substrings anySatisfy: [ : each | 
			each asUppercase endsWith: aString asUppercase ]
