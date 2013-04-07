*BioTools
includesBeginWith: aString
	" Answer whether aString begins like one of the receiver's sub strings elements. "

	^ self substrings anySatisfy: [ : each | 
			each asUppercase beginsWith: aString asUppercase ]
