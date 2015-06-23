testing
includesNameBeginsWith: aString
	" Answer whether the receiver begins with aString. "

	^ (self names asLowercase anySatisfy: [ : n | n beginsWith: aString asLowercase ]) 
		or: [ self synonyms asLowercase anySatisfy: [: s | s beginsWith: aString asLowercase ] ]